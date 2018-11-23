package br.senai.sp.model;

public class DuplicataPagar_PedidoCompra {

	private Integer idPedidoCompra;
	private Integer idDuplicataPagar;
	
	public DuplicataPagar_PedidoCompra(Integer idPedidoCompra,Integer idDuplicataPagar){
		this.idDuplicataPagar = idDuplicataPagar;
		this.idPedidoCompra = idPedidoCompra;
	}

	public Integer getIdPedidoCompra() {
		return idPedidoCompra;
	}

	public void setIdPedidoCompra(Integer idPedidoCompra) {
		this.idPedidoCompra = idPedidoCompra;
	}

	public Integer getIdDuplicataPagar() {
		return idDuplicataPagar;
	}

	public void setIdDuplicataPagar(Integer idDuplicataPagar) {
		this.idDuplicataPagar = idDuplicataPagar;
	}
	
	
	
}
