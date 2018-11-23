package br.senai.sp.model;

public class AdicionarContasPagar {
	
	private String despesas;
	private String vencimento;
	private Float valor;
	private String conta;
	
	
	public AdicionarContasPagar(String despesas, String vencimento,float valor2){
		this.despesas = despesas;
		this.valor = valor2;
		this.vencimento = vencimento;
	}

	public String getDespesas() {
		return despesas;
	}

	public void setDespesas(String despesas) {
		this.despesas = despesas;
	}

	public String getVencimento() {
		return vencimento;
	}

	public void setVencimento(String vencimento) {
		this.vencimento = vencimento;
	}

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	public String getConta() {
		return conta;
	}

	public void setConta(String conta) {
		this.conta = conta;
	}

	
}
