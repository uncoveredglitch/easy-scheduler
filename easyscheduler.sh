#current time
current_time=$(date +"%T") 

#current system time in seconds
current_seconds=$(echo $current_time | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')

#program starts at this time
at_time="23:59:48"

# program starts time in seconds
at_seconds=$(echo $at_time | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')
duration=`expr $at_seconds - $current_seconds `

#countdown begin
sleep $duration

#command
rclone copy a_drive_online: a_drive_offline: --include-from "fileList.txt" -vv -P --transfers 1
