package br.senai.sp.model;

public class ContasPagar {

	private Integer id;
	private String nome;
	private String vencimento;
	private String valor;
	private Integer idconta;
	
	public ContasPagar(Integer id, String nome, String vencimento, Integer idconta, String valor){
	
		this.id = id;
		this.nome = nome;
		this.vencimento = vencimento;
		this.valor = valor;
		this.idconta = idconta;	
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getVencimento() {
		return vencimento;
	}

	public void setVencimento(String vencimento) {
		this.vencimento = vencimento;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public Integer getIdconta() {
		return idconta;
	}

	public void setIdconta(Integer idconta) {
		this.idconta = idconta;
	}

	
	
	
	
}
