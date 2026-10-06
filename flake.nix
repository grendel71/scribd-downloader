{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem (system:
			let pkgs = import nixpkgs {
				inherit system;
			}; in {
				devShell = pkgs.mkShell {
					packages = with pkgs; [
						python313
						uv
						chromium
						chromedriver
					];
					shellHook = ''
						source ./.venv/bin/activate
						export UV_PYTHON="$(command -v python3.13)"
						export SCRIBD_CHROMIUM_BINARY="${pkgs.chromium}/bin/chromium"
						export SE_CHROMEDRIVER="${pkgs.chromedriver}/bin/chromedriver"
					'';
				};
			}
		);
}
