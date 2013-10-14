#!/bin/bash

hosts=$(<serverList)
newpub=$(<mykeyNew.pub)

function updating_key()
{
	 ssh -i mykey-old user@$i "echo $newpub > storage && cat .ssh/authorized_keys >> storage && cat storage > .ssh/authorized_keys && rm storage"
}

function delete_key()
{
	 ssh -i mykey-new user@$i "touch storage && cat .ssh/authorized_keys > storage && sed '2d' storage  > .ssh/authorized_keys && rm storage"
}

for i in $hosts
do

if [[ $1 == "update" ]];
then
	updating_key

elif [[ $1 == "delete" ]];
then
	delete_key

fi
done
