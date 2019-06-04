if [  $# -le 3 ] 
	then 
		echo "Usage: ./addNewServer.sh [Username] [Host] [Port] [Friendly Name]"
		exit 1
	fi 
echo "Adding SSH Key for $1 on Server $2"
ssh-copy-id -i ~/.ssh/id_rsa.pub -p $3 -o StrictHostKeyChecking=no $1@$2
echo "Adding shortcut for $2 with name $4"
echo "./ssh.sh $1 $2 $3" >> servers/$4.sh
chmod 777 servers/$4.sh

