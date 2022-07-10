echo "Store vault password to file..."
echo "netology" > vpf.txt

echo "Up containers..."
docker compose up -d

echo "Install Python3 on ubuntu..."
docker exec ubuntu apt update >/dev/null 2>/dev/null
docker exec ubuntu apt install -y python3 >/dev/null 2>/dev/null

echo "Run ansible playbook..."
ansible-playbook site.yml --vault-password-file vpf.txt -i inventory/prod.yml

echo "Shutdown containers..."
docker compose down

echo "Remove vault password file..."
rm vpf.txt
