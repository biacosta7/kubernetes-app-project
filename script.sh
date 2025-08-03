echo "Criando as imagens..."

docker build -t beatrizcosta/projeto-backend:1.0 backend/.
docker build -t beatrizcosta/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."
docker push beatrizcosta/projeto-backend:1.0
docker push beatrizcosta/projeto-database:1.0

echo "Criando services no cluster kubernetes..."
kubectl apply -f ./services.yml

echo "Criando deployments..."
kubectl apply -f ./deployment.yml
