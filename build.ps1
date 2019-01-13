$ErrorActionPreference = 'Stop';
Write-Host Starting build

if ($isWindows) {
  docker build --pull -t alpine-panstamp -f Dockerfile.windows .
} else {
  docker build -t alpine-panstamp --build-arg "arch=$env:ARCH" .
}

docker images
