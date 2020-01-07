
function aws-auth
    set token $argv[1]
    if [ -z "$token" ]
        echo "Usage: $0 TOKEN"
        return 1
    end
    set -e AWS_SESSION_TOKEN
    set -e AWS_ACCESS_KEY_ID
    set -e AWS_SECRET_ACCESS_KEY
    set arn (aws sts get-caller-identity --output text --query 'Arn' | sed 's/user/mfa/g'); or return $status
    set result (aws sts get-session-token --serial-number $arn --token-code $token); or return $status
    set -gx AWS_ACCESS_KEY_ID (echo $result | jq -r '.Credentials.AccessKeyId')
    set -gx AWS_SECRET_ACCESS_KEY (echo $result | jq -r '.Credentials.SecretAccessKey')
    set -gx AWS_SESSION_TOKEN (echo $result | jq -r '.Credentials.SessionToken')
end
