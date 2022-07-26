set -q AWS_REGION || set AWS_REGION "us-east-1"

echo "Profile, Log Group Name, Retention in Days, Size in Bytes, Size in MBs" > log_groups.csv
for i in ( aws configure list-profiles | tail -n +2 )
    set AWS_PROFILE $i
    echo $AWS_PROFILE
    aws logs describe-log-groups --query  "logGroups[*].{logGroupName:logGroupName, retentionInDays:retentionInDays, storedBytes:storedBytes}" | jq -r ".[] | [\"$AWS_PROFILE\", .logGroupName, .retentionInDays, .storedBytes, ( (.storedBytes / 1048576) |floor|tostring + \" MB\" )  ] | @csv"  >> log_groups.csv
end
