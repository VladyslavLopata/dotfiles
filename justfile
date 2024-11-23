get:
	flutter pub get

br:
	dart run build_runner build
brn: 
	dart run build_runner build -d

bw:
	dart run build_runner watch -d
clean:
	flutter clean
up:
	flutter pub upgrade --major-versions
test:
	flutter test


pod:
	cd ios && pod deintegrate && rm -rf Podfile.lock && pod install --repo-update

rb:
	git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done

push:
	git push --force-with-lease
mine:
	jira issue list -a$(jira me) --order-by updated --no-headers -s~Done
unassigned:
	jira issue list -ax --created week --order-by updated --no-headers -s~Done
view id:
	jira issue view {{id}}
cr id:
	jira issue move {{id}} "Code Review"
staging version:
	git tag -a release/staging/{{version}} -m "release/staging/{{version}}" && git push origin release/staging/{{version}}
prod version:
	git tag -a release/production/{{version}} -m "release/production/{{version}}" && git push origin release/production/{{version}}
