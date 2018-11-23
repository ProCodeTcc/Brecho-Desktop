package br.senai.sp.model;

public class AdicionarDuplicataPagar {
	private Integer vencida;
	private Integer status;
	private String dtPagamento;
	private Float valor;
	private String dtVencimento;
	private Integer idConta;

	public AdicionarDuplicataPagar(Integer vencida,Integer status,String dtPagamento,Float valor,String dtVencimento,Integer idConta){
		this.vencida= vencida;
		this.status = status;
		this.dtPagamento = dtPagamento;
		this.valor = valor;
		this.dtVencimento = dtVencimento;
		this.idConta = idConta;
	}

	public Integer getVencida() {
		return vencida;
	}

	public void setVencida(Integer vencida) {
		this.vencida = vencida;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDtPagamento() {
		return dtPagamento;
	}

	public void setDtPagamento(String dtPagamento) {
		this.dtPagamento = dtPagamento;
	}

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	public String getDtVencimento() {
		return dtVencimento;
	}

	public void setDtVencimento(String dtVencimento) {
		this.dtVencimento = dtVencimento;
	}

	public Integer getIdConta() {
		return idConta;
	}

	public void setIdConta(Integer idConta) {
		this.idConta = idConta;
	}




}
