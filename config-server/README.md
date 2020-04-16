curl -H "Authorization: Basic $(echo -n config-server:cs@123456 | base64)" http://localhost:8888/producer/local/master | jq
