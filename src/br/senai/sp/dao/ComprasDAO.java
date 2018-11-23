package br.senai.sp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import br.senai.sp.banco.Conexao;
import br.senai.sp.model.AdicionarCompras;
import br.senai.sp.model.AdicionarDuplicataPagar;
import br.senai.sp.model.Compras;
import br.senai.sp.model.DuplicataPagar_PedidoCompra;
import br.senai.sp.model.Fornecedor;

public class ComprasDAO {
	private ArrayList<Compras> lista = new ArrayList<>();

	public static ComprasDAO instance;

	private int last_inserted_id;
	private int ultimo_id;
	
	public void salvarCompra(AdicionarCompras compra){
		String sql = "INSERT INTO pedidocompra (valorPedido,data,dataVencimento,titulo,descricao,qtdparcelas) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement stm = Conexao.getConexao().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			stm.setFloat(1, compra.getValor());
			stm.setString(2, compra.getData());
			stm.setString(3, compra.getVencimento());
			stm.setString(4, compra.getTitulo());
			stm.setString(5, compra.getDescricao());
			stm.setInt(6, compra.getParcela());
			
			stm.executeUpdate();
			
			ResultSet rs = stm.getGeneratedKeys();
            if(rs.next())
            {
               last_inserted_id = rs.getInt(1);
            }
            
			Conexao.fecharConexao();			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void salvarDuplicataPagar(AdicionarDuplicataPagar duplicata){
		String sql = "INSERT INTO duplicataPagar (vencida,statusBaixa,dtPagamento,valorReal,dtVencimento,idConta) VALUES (?,?,?,?,?,?)";
		
		try {
			PreparedStatement stm = Conexao.getConexao().prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			stm.setFloat(1, duplicata.getVencida());
			stm.setInt(2, duplicata.getStatus());
			stm.setString(3, duplicata.getDtPagamento());
			stm.setFloat(4, duplicata.getValor());
			stm.setString(5, duplicata.getDtVencimento());
			stm.setInt(6, duplicata.getIdConta());
			
			stm.executeUpdate();
			
			ResultSet rs = stm.getGeneratedKeys();

            while(rs.next())
            {
                ultimo_id = rs.getInt(1);
                relacionamento();
            }
						
			Conexao.fecharConexao();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static ComprasDAO getInstance(){
		if (instance == null)
			instance = new ComprasDAO();

		return instance;
	}
	
	public void relacionamento(){
		
		int id1 = last_inserted_id;
		int id2 = ultimo_id;
		
		String sqlR = "INSERT INTO duplicatapagar_pedidocompra (idDuplicata,idPedidoCompra) VALUES (?,?)";

		try {
			PreparedStatement stm = Conexao.getConexao().prepareStatement(sqlR,Statement.RETURN_GENERATED_KEYS);
			stm.setFloat(1, id2);
			stm.setInt(2, id1);
			stm.execute();
			
			Conexao.fecharConexao();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
