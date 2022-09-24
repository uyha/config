# shellcheck shell=bash
# shellcheck source=/dev/null

return 0

if [[ $- == *i* &&
  -f /usr/local/share/blesh/ble.sh &&
  -r /usr/local/share/blesh/ble.sh ]]; then
  source /usr/local/share/blesh/ble.sh --noattach

  _ble_post_run() {
    if [[ "${BLE_VERSION-}" ]]; then
      ble-attach
    fi
  }

  post_run+=(_ble_post_run)
fi
