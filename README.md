# BDSX-Docker Image
Hi! I'm the person who created a working BDSX-Dockerimage. :)

## How did I make it?

I searched the whole Internet and all Forums for Wine-Support and finally got it working after hours of debugging.

## How to use it?
Download the working image from [Dockerhub](https://hub.docker.com/r/bloody160/bdsx) and start it with:
`docker run -it -p <Your desired Port>:19132/udp bloody160/bdsx:latest`

## Disable The Tests
Go into the entrypoint.sh and uncomment the following lines by removing the '#':
`#rm -f index.ts`
`#touch index.ts`