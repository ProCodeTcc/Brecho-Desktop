package br.senai.sp.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class AdicionarCompras {

	private int idPedidoCompra;
	private String titulo;
	private String vencimento;
	private String descricao;
	private float valor;
	private String data;
	private int parcela;
	
	public AdicionarCompras (String titulo,String vencimento,String descricao,Float valor, String data,Integer parcela){
		this.titulo = titulo;
		this.vencimento = vencimento;
		this.descricao = descricao;
		this.valor = valor;
		this.data = data;
		this.parcela = parcela;
	}

	
	
	public int getIdPedidoCompra() {
		return idPedidoCompra;
	}



	public void setIdPedidoCompra(int idPedidoCompra) {
		this.idPedidoCompra = idPedidoCompra;
	}



	public int getParcela() {
		return parcela;
	}

	public void setParcela(int parcela) {
		this.parcela = parcela;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getVencimento() {
		return vencimento;
	}

	public void setVencimento(String vencimento) {
		this.vencimento = vencimento;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public float getValor() {
		return valor;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}
	
	
	
	
}
