curl -H "Authorization: Basic $(echo -n config-server:cs@123456 | base64)" http://localhost:8888/producer/local/master | jq


# APPLICATION / PROFILE / LABEL
curl -H "Authorization: Basic $(echo -n config-server:cs@123456 | base64)" http://localhost:8888/salesforce-auth/tb/master | jq

curl -H "Authorization: Basic $(echo -n config-server:cs@123456 | base64)" http://localhost:8888/salesforce-auth/gl/master | jq