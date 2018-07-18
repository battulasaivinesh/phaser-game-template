#!/bin/bash
sprite_list=$( ls spritesheet/ )
image_list=$( ls image/ )
audio_list=$( ls audio/)
path="../AssetManifest.js"
echo "const AssetManifest = {">$path



if [ -z "$image_list" ]; then
	:
else
	echo -e "\t'image': [" >>$path

	for word in $image_list
	do
	    if [ ${word: -3} = "png" ] || [ ${word: -3} = "jpg" ] || [ ${word: -4} = "jpeg" ] || [ ${word: -3} = "gif" ]; then
	    	echo -e "\t\t'$word',">>$path
	    fi
	done

	echo -e '\t],' >> $path
fi

if [ -z "$sprite_list" ]; then
	:
else
	echo -e "\t'spritesheet': [" >>$path

	for word in $sprite_list
	do
		if [ ${word: -3} = "png" ] || [ ${word: -3} = "jpg" ] || [ ${word: -4} = "jpeg" ] || [ ${word: -4} = "json" ]; then
	    	echo -e "\t\t'$word',">>$path
	    fi
	done

	echo -e '\t],' >> $path
fi

if [ -z "$audio_list" ]; then
	:
else
	echo -e "\t'audio': [" >>$path

	for word in $audio_list
	do
	    if [ ${word: -3} = "mp3" ] || [ ${word: -3} = "mp4" ]; then
	    	echo -e "\t\t'$word',">>$path
	    fi
	done

	echo -e '\t]' >> $path
fi

echo -e "};\nexport default AssetManifest;" >> $path



