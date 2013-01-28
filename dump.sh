#!env zsh

for page in ids/*.json
  echo "Dumping page ${page%.json}"
  for id in `jq '.ids[]' < ${page}`
    rm object/${id}.json
    http http://165.225.128.86/object/${id} > object/${id}.json &
  done
  wait
done