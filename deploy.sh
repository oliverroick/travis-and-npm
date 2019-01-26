cp .npmrc $HOME/.npmrc
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")

if [ "$PACKAGE_VERSION" != "$TRAVIS_TAG" ]
then
    echo "Git and NPM do not match"; exit 1;
fi;

RELEASE_TAG="latest"
if [[ $PACKAGE_VERSION =~ .*alpha.* || $PACKAGE_VERSION =~ .*beta.* ]]; then
    RELEASE_TAG="dev-$PACKAGE_VERSION"
fi;

npm publish --tag=$RELEASE_TAG
