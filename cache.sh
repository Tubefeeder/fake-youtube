#! /bin/zsh

mkdir -p data/videos

sub_list=$(sed "s/youtube,//g;s/\"//g" subscriptions.csv)

echo $sub_list | while IFS=" " read p; do
    curl "www.youtube.com/feeds/videos.xml?channel_id=$p" -o "data/videos/$p.xml"
done 
