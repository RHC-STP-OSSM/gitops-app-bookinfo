oc create secret generic bookinfo-credential-mutual -n istio-system  --from-file=tls.key=bookinfo.example.com.key \
--from-file=tls.crt=bookinfo.example.com.crt --from-file=ca.crt=example.com.crt
