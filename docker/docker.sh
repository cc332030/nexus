
program_home=/home/program

name=nexus
app_home=/opt/sonatype

docker stop $name

docker rm $name

data_dir=$program_home/$name/nexus-data
mkdir $data_dir
chmod 777 $data_dir

work_dir=$program_home/$name/sonatype-work
mkdir $work_dir
chmod 777 $work_dir


docker run -d --restart unless-stopped \
  --name $name \
  -p 9000:8081 \
  -v /etc/localtime:/etc/localtime \
  -v $data_dir:/nexus-data \
  -v $work_dir:$app_home/sonatype-work \
  sonatype/nexus3

docker logs $name
