# AWS SSM on Ubuntu

## Install ssm agent on ubuntu
Following command will use to install ssm on ubuntu
```
$ sudo snap install amazon-ssm-agent --classic
$ sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service
$ sudo systemctl status snap.amazon-ssm-agent.amazon-ssm-agent.service
```

## Add role to ec2 instance

1. create a IAM role and attach policy `AmazonEC2RoleforSSM`
2. Trust relationship

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```
3. Attached role with ec2 instance

## Connect with ec2 instance via ssm

1. We can connect via following command to ec2 instance

    ```
    $ aws ssm start-session --target "i-xxxxxxxx"`
    ```
2. If you dont need to know instance ID you can use following command with instance name it will return you instance ID

    ```
    $ echo $(aws ec2 describe-instances --filter 'Name=tag:Name,Values="*abaid*"' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[] | [.InstanceId] | @csv')
    ```

