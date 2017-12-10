cat << EOF > FtpSourceConnector.json
{
  "name": "FtpSourceConnector",
  "config": {
    "connector.class": "com.eneco.trading.kafka.connect.ftp.source.FtpSourceConnector",
    "tasks.max": "1",
    "ftp.address": "",
    "ftp.user": "",
    "ftp.password": "",
    "ftp.refresh": "",
    "ftp.file.maxage": "",
    "ftp.keystyle": ""
  }
}
EOF
curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" -d @FtpSourceConnector.json /api/kafka-connect/connectors
