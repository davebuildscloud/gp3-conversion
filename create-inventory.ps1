#Generates a csv file of all GP2 type EBS volumes in a given AWS Account.  Outputs to c:\temp\gp3.csv

Install-Module "aws.tools.ec2" -force

get-ec2volume -Filter @{ Name="volume-type"; Values="gp2"} | Select-Object -Property VolumeID,Size,State | export-csv -LiteralPath c:\temp\gp3.csv

 
