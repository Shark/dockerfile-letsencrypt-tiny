# dockerfile-letsencrypt-tiny

This repository contains a Dockerfile which bundles [acme-tiny](https://github.com/diafygi/acme-tiny) with custom scripts for certificate management. The image can found as an automated build on [Docker Hub](https://hub.docker.com/r/sh4rk/letsencrypt-tiny/).

## Usage

`make`

- Generate a RSA key: `openssl genrsa 4096 > new.key`
- Generate a CSR: `openssl req -new -sha256 -key new.key -subj "/CN=example.invalid" > example.csr`

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request! :)

## History

- v0.1.0 (2016-03-09): initial version

## License

This project is licensed under the MIT License. See LICENSE for details.
