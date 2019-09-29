ARG NIX_VERSION
FROM nixos/nix:$NIX_VERSION

RUN set -o nounset \
	&& echo -e "\n-- Initializing Nixpkgs\n" \
	&& apk --no-cache add sudo \
	&& nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs \
	&& nix-channel --update \
	&& nix-env -iA nixpkgs.git

COPY shell.nix /root/
COPY nix/ /root/tools/cfg/nix/

RUN set -o nounset \
	&& echo -e "\n-- Building shell.nix\n" \
	&& cd /root \
	&& mkdir -p .gcroots \
	&& nix-instantiate shell.nix --indirect --add-root "$PWD/.gcroots/shell.drv" \
	&& deps="$(nix-store --query --references "$PWD/.gcroots/shell.drv")" \
	&& nix-store --indirect --add-root "$PWD/.gcroots/shell.dep" --realise $deps \
	&& nix-collect-garbage --delete-old \
	&& nix-shell .gcroots/shell.drv --run exit \
	&& nix-store --optimise \
	&& rm -r /root/shell.nix /root/tools/cfg/nix/

WORKDIR /root
CMD ["nix-shell", ".gcroots/shell.drv"]
