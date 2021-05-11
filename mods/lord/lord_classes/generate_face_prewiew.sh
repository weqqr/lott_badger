path=textures

files=`ls $path/preview*`
for file in $files
do
	name="${file%.png}"
	facename=$name"_face.png"
	convert -crop 19x34+0x0 "$file" "$facename"
done
