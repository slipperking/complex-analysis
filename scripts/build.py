import os
import subprocess
import sys


def main() -> None:
    root = os.path.dirname(os.path.abspath(__file__))
    py_files = []

    for dirpath, _, files in os.walk(root):
        for file_name in files:
            if file_name.endswith(".py"):
                path = os.path.join(dirpath, file_name)
                if os.path.abspath(path) == os.path.abspath(__file__):
                    continue
                py_files.append(path)

    py_files.sort()

    invocation_dir = os.getcwd()

    for path in py_files:
        print(f"Running {path}")
        result = subprocess.run([sys.executable, path], cwd=invocation_dir)
        if result.returncode != 0:
            print(f"script failed: {path} (exit code {result.returncode})", file=sys.stderr)
            sys.exit(result.returncode)

    print("all scripts completed successfully.")


if __name__ == "__main__":
    main()
