#!env zsh

for page in ids/*.json; do
  echo "Dumping page ${page%.json}"
  for id in `jq '.ids[]' < ${page}`; do
    rm object/${id}.json &> /dev/null
    http http://165.225.128.86/object/${id} > object/${id}.json &
  done
  wait
done