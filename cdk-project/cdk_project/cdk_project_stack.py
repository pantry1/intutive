from aws_cdk import (
    aws_ec2 as ec2,
    aws_s3 as s3,
)
from aws_cdk.core import Construct, Stack


class NetworkingStack(Stack):
    def __init__(self, scope: Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        vpc = ec2.Vpc(self, 'MyVpc',
            cidr='10.0.0.0/16',
            max_azs=2,
            subnet_configuration=[
                ec2.SubnetConfiguration(
                    name='Public',
                    subnet_type=ec2.SubnetType.PUBLIC
                )
            ]
        )


class ComputeStorageStack(Stack):
    def __init__(self, scope: Construct, id: str, vpc: ec2.Vpc, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        instance1 = ec2.CfnInstance(self, 'Instance1',
            instance_type='t2.micro',
            image_id='ami-12345678',  # Replace with the desired AMI ID
            subnet_id=vpc.public_subnets[0].subnet_id,
            availability_zone='us-east-1a',
            block_devices=[
                {
                    'device_name': '/dev/xvda',
                    'ebs': {
                        'volume_type': 'gp2',
                        'volume_size': 30,
                        'encrypted': True
                    }
                }
            ]
        )

        instance2 = ec2.CfnInstance(self, 'Instance2',
            instance_type='t2.micro',
            image_id='ami-12345678',  # Replace with the desired AMI ID
            subnet_id=vpc.public_subnets[1].subnet_id,
            availability_zone='us-east-1b',
            block_devices=[
                {
                    'device_name': '/dev/xvda',
                    'ebs': {
                        'volume_type': 'gp2',
                        'volume_size': 30,
                        'encrypted': True
                    }
                }
            ]
        )


class S3BucketStack(Stack):
    def __init__(self, scope: Construct, id: str, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        bucket = s3.Bucket(self, 'MyBucket',
            encryption=s3.BucketEncryption.S3_MANAGED,
            versioned=True,
            server_access_logs_bucket=s3.Bucket(self, 'LogsBucket'),
            server_access_logs_prefix='logs/'
        )

