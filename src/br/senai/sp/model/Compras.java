package br.senai.sp.model;

import com.mysql.fabric.xmlrpc.base.Data;

public class Compras {

	private Integer id;
	private String valor;
	private Data data;
	private String vencimento;
	private String titulo;
	private String descricao;
	private Integer quantidade;

	public Compras(Integer id,String valor,String vencimento,String titulo,String descricao){
		this.id = id;
		this.valor = valor;
		this.vencimento = vencimento;
		this.titulo = titulo;
		this.descricao = descricao;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public Data getData() {
		return data;
	}

	public void setData(Data data) {
		this.data = data;
	}

	public String getVencimento() {
		return vencimento;
	}

	public void setVencimento(String vencimento) {
		this.vencimento = vencimento;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}


}
