
put_swap() {
    SIZE=${1:-1}
    sudo swapoff /swapfile > /dev/null 2>&1 || true
    echo | sudo tee /swapfile
    sudo fallocate -l $((1 * $SIZE))G /swapfile || sudo dd if=/dev/zero of=/swapfile bs=$((1024 * $SIZE)) count=1048576
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo free -h
}
