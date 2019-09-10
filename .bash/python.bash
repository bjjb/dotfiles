venv() {
  # shellcheck source=/dev/null
  venv="${HOME}/.venv"
  if ! [ -d "${venv}" ]
  then
    python3 -m venv "${venv}"
  fi
  # shellcheck source=/dev/null
  . "${venv}/bin/activate"
}

# Activate a python3 virtual environment (if python3 is installed).
which python3 > /dev/null && venv
