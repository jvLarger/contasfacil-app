class BusinessException implements Exception {
  String mensagem;
  
  BusinessException(this.mensagem);
  
  @override
  String toString() {
    return mensagem;
  }
}