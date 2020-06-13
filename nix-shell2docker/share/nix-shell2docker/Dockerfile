ARG NIX_VERSION
FROM nixos/nix:$NIX_VERSION

RUN set -o nounset \
	&& echo -e "\n-- Initializing Nixpkgs\n" \
	&& nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs \
	&& nix-channel --update \
	&& nix-env -iA nixpkgs.git \
	&& echo -e "\n-- Configuring sudo\n" \
	&& echo 'ALL ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers \
	&& mkdir /etc/pam.d \
	&& echo -e '\
account required pam_unix.so\n\
auth sufficient pam_unix.so likeauth try_first_pass\n\
auth required pam_deny.so\n\
password sufficient pam_unix.so nullok sha512\n\
session required pam_unix.so' \
> /etc/pam.d/sudo

COPY nix-shell-wrapper /usr/bin/
COPY nix/ /root/tools/cfg/nix/

RUN set -o nounset \
	&& echo -e "\n-- Building shell.nix\n" \
	&& cd /root \
	&& mkdir -p .gcroots \
	&& nix-instantiate tools/cfg/nix/shell.nix --indirect --add-root "$PWD/.gcroots/shell.drv" \
	&& deps="$(nix-store --query --references "$PWD/.gcroots/shell.drv")" \
	&& nix-store --indirect --add-root "$PWD/.gcroots/shell.dep" --realise $deps \
	&& nix-collect-garbage --delete-old \
	&& nix-shell .gcroots/shell.drv --run exit \
	&& nix-store --optimise

ENV CI_PROJECT_DIR /root
WORKDIR $CI_PROJECT_DIR
ENTRYPOINT ["/usr/bin/nix-shell-wrapper"]
CMD ["exec bash"]
