$(echo $aws ec2 describe-instances --filter 'Name=tag:Name,Values="*abaid*"' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[] | [.InstanceId] | @csv')
$(echo $(aws ec2 describe-instances --filters "Name=tag:Name,Values=*qesandbox*") | jq -r '.Reservations[0].Instances[]|.Tags[]|select(.Key=="Name")|.Value')")
aws ssm start-session --target $(echo $(aws ec2 describe-instances --filter 'Name=tag:Name,Values="*abaid*"' 'Name=instance-state-name,Values=running' | jq -r '.Reservations[].Instances[] | [.InstanceId] | @csv' )")


