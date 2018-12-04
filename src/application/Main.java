package application;

import javafx.application.Application;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;

public class Main extends Application {

	static Stage primaryStage;

	@Override
	public void start(Stage primaryStage){
		Main.primaryStage = primaryStage;

		Main.abrirTela("Main");
	}

	public static void abrirTela(String nomeArquivo) {

		Parent tela;
		try{
			tela = FXMLLoader.load(Main.class.getResource(nomeArquivo + ".fxml"));

			Scene sc = new Scene(tela);

			primaryStage.setScene(sc);
			primaryStage.show();
			primaryStage.setResizable(false);

			}catch(Exception ex){
				ex.printStackTrace();
			}

	}

	public static void abrirTela(String nomeArquivo, Object controller){
		//Abrir tela:
		Parent tela;

		try{

			FXMLLoader loader = new FXMLLoader(Main.class.getResource(nomeArquivo+".fxml"));

			//definindo controller
			loader.setController(controller);

			//carregar o arquivo XML
			tela = loader.load();


			//Criando a cena
			Scene sc = new Scene(tela);

			//Exibindo a cena no stage principal
			primaryStage.setScene(sc);
			primaryStage.show();



		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

		public static void abrirNovaJanela(String nomeArquivo){

			Parent tela;

			try{
				tela = FXMLLoader.load(Main.class.getResource(nomeArquivo + ".fxml"));

				Scene sc = new Scene(tela);

				Stage stage = new Stage();

				stage.setScene(sc);

				stage.show();


			}catch(Exception ex){
				ex.printStackTrace();
			}
		}

		public void exit(){
		   primaryStage.close();
		}
		
		@FXML
		public void entrar(){
			Main.abrirTela("Menu");
		}

	public static void main(String[] args) {
		launch(args);
	}
}
