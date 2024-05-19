# OpenFGA CLI DevContainer Feature

This DevContainer feature installs the OpenFGA CLI. You can specify the version, architecture, and file extension for the installation.

## Usage

To use this feature in your DevContainer, add it to your `.devcontainer/devcontainer.json` configuration file and specify the desired options.

### Example

```json
"features": {
  "ghcr.io/partydrone/devcontainer/features/openfga-cli": {}
}
```

## Options

| Option       | Description                                        | Default | Values                                    |
|--------------|----------------------------------------------------|---------|-------------------------------------------|
| **version**  | The version of the OpenFGA CLI to install          | `0.4.0` | Any valid OpenFGA CLI version             |
| **arch**     | The architecture to install for                    | `arm64` | `amd64`, `arm64`                          |
| **extension** | The file extension of the package to install      | `deb`   | `apk`, `deb`, `rpm`                       |

## Installation Script

The `install.sh` script handles the installation process. It constructs the download URL based on the provided options and downloads the OpenFGA CLI. The script supports various file extensions and performs the necessary installation steps accordingly.

## Verifying Installation

After the installation, the script verifies the installation by running the openfga version command.

## Contributing

If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
