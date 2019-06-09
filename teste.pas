unit DNFVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PadraoDm, FMTBcd, Provider, DBClient, DB, SqlExpr, SimpleDS,
  pcnAuxiliar, pcnConversao, StrUtils, ud2kComponent, ud2kPesquisa,
  Math, ACBrUtil, pcnConversaoNFe, ud2kReatorPrincipal, StdCtrls,
  DateUtils, ACBrDFeUtil;

type
  TdmNFVenda = class(TrepPadraoDm)
    sdsNFVenda: TSQLDataSet;
    cdsNFVenda: TClientDataSet;
    dspNFVenda: TDataSetProvider;
    sdsNFVendaItem: TSQLDataSet;
    cdsNFVendaItem: TClientDataSet;
    dspNFVendaItem: TDataSetProvider;
    sdsNFVendaCODNFVENDA: TIntegerField;
    sdsNFVendaCODSERIE: TStringField;
    sdsNFVendaCODPESSOA: TIntegerField;
    sdsNFVendaCODFORMAPAGAMENTO: TIntegerField;
    sdsNFVendaCODCFOP: TStringField;
    sdsNFVendaNFV_TIPO: TStringField;
    sdsNFVendaNFV_DTEMISSAO: TDateField;
    sdsNFVendaNFV_SELO_FISCAL: TStringField;
    sdsNFVendaNFV_ICMS_BASE: TFloatField;
    sdsNFVendaNFV_ICMS_ALIQ: TIntegerField;
    sdsNFVendaNFV_ICMS: TFloatField;
    sdsNFVendaNFV_ISS_BASE: TFloatField;
    sdsNFVendaNFV_ISS: TFloatField;
    sdsNFVendaNFV_ISS_ALIQ: TIntegerField;
    sdsNFVendaNFV_IPI: TFloatField;
    sdsNFVendaNFV_FRETE: TFloatField;
    sdsNFVendaNFV_TOTAL_PRODUTOS: TFloatField;
    sdsNFVendaNFV_TOTAL_NOTA: TFloatField;
    sdsNFVendaNFV_OBS: TBlobField;
    sdsNFVendaNFV_OBS_ADICIONAIS: TBlobField;
    sdsNFVendaNFV_STATUS: TStringField;
    sdsNFVendaNFV_GER_FINANCEIRO: TStringField;
    sdsNFVendaNFV_VOLUMES: TFloatField;
    sdsNFVendaNFV_PIS_PERC: TFloatField;
    sdsNFVendaNFV_COFINS_PERC: TFloatField;
    sdsNFVendaNFV_CS_PERC: TFloatField;
    sdsNFVendaNFV_ISS_PERC: TFloatField;
    sdsNFVendaNFV_IR_PERC: TFloatField;
    sdsNFVendaNFV_OBS_CANCELAMENTO: TStringField;
    sdsNFVendaNFV_OBS_INTERNA: TStringField;
    sdsNFVendaNFV_INSS_PERC: TFloatField;
    sdsNFVendaNFV_OUTROS_PERC: TFloatField;
    sdsNFVendaNFV_ALTERAR_BASE_ICMS: TStringField;
    sdsNFVendaPES_NOME: TStringField;
    sdsNFVendaCFOP_DESCRICAO: TStringField;
    cdsNFVendaCODNFVENDA: TIntegerField;
    cdsNFVendaCODSERIE: TStringField;
    cdsNFVendaCODPESSOA: TIntegerField;
    cdsNFVendaCODFORMAPAGAMENTO: TIntegerField;
    cdsNFVendaCODCFOP: TStringField;
    cdsNFVendaNFV_TIPO: TStringField;
    cdsNFVendaNFV_DTEMISSAO: TDateField;
    cdsNFVendaNFV_SELO_FISCAL: TStringField;
    cdsNFVendaNFV_ICMS_BASE: TFloatField;
    cdsNFVendaNFV_ICMS_ALIQ: TIntegerField;
    cdsNFVendaNFV_ICMS: TFloatField;
    cdsNFVendaNFV_ISS_BASE: TFloatField;
    cdsNFVendaNFV_ISS: TFloatField;
    cdsNFVendaNFV_ISS_ALIQ: TIntegerField;
    cdsNFVendaNFV_IPI: TFloatField;
    cdsNFVendaNFV_FRETE: TFloatField;
    cdsNFVendaNFV_TOTAL_PRODUTOS: TFloatField;
    cdsNFVendaNFV_TOTAL_NOTA: TFloatField;
    cdsNFVendaNFV_OBS: TBlobField;
    cdsNFVendaNFV_OBS_ADICIONAIS: TBlobField;
    cdsNFVendaNFV_STATUS: TStringField;
    cdsNFVendaNFV_GER_FINANCEIRO: TStringField;
    cdsNFVendaNFV_VOLUMES: TFloatField;
    cdsNFVendaNFV_PIS_PERC: TFloatField;
    cdsNFVendaNFV_COFINS_PERC: TFloatField;
    cdsNFVendaNFV_CS_PERC: TFloatField;
    cdsNFVendaNFV_ISS_PERC: TFloatField;
    cdsNFVendaNFV_IR_PERC: TFloatField;
    cdsNFVendaNFV_OBS_CANCELAMENTO: TStringField;
    cdsNFVendaNFV_OBS_INTERNA: TStringField;
    cdsNFVendaNFV_INSS_PERC: TFloatField;
    cdsNFVendaNFV_OUTROS_PERC: TFloatField;
    cdsNFVendaNFV_ALTERAR_BASE_ICMS: TStringField;
    cdsNFVendaPES_NOME: TStringField;
    cdsNFVendaCFOP_DESCRICAO: TStringField;
    sdsNFVendaItemCODNFVENDAITEM: TIntegerField;
    sdsNFVendaItemCODNFVENDA: TIntegerField;
    sdsNFVendaItemCODSERIE: TStringField;
    sdsNFVendaItemCODPRODUTO: TIntegerField;
    sdsNFVendaItemNFVI_VLR_UNITARIO: TFloatField;
    sdsNFVendaItemNFVI_QTDE: TFloatField;
    sdsNFVendaItemNFVI_TOTAL: TFloatField;
    sdsNFVendaItemNFVI_IPI: TFloatField;
    sdsNFVendaItemNFVI_ALIQ_IPI: TIntegerField;
    sdsNFVendaItemNFVI_ICMS: TFloatField;
    sdsNFVendaItemNFVI_ALIQ_ICMS: TIntegerField;
    sdsNFVendaItemPRO_DESCRICAO: TStringField;
    cdsNFVendaItemCODNFVENDAITEM: TIntegerField;
    cdsNFVendaItemCODNFVENDA: TIntegerField;
    cdsNFVendaItemCODSERIE: TStringField;
    cdsNFVendaItemCODPRODUTO: TIntegerField;
    cdsNFVendaItemNFVI_VLR_UNITARIO: TFloatField;
    cdsNFVendaItemNFVI_QTDE: TFloatField;
    cdsNFVendaItemNFVI_TOTAL: TFloatField;
    cdsNFVendaItemNFVI_IPI: TFloatField;
    cdsNFVendaItemNFVI_ALIQ_IPI: TIntegerField;
    cdsNFVendaItemNFVI_ICMS: TFloatField;
    cdsNFVendaItemNFVI_ALIQ_ICMS: TIntegerField;
    cdsNFVendaItemPRO_DESCRICAO: TStringField;
    sdsNFVendaItemCODPESQUISA: TStringField;
    cdsNFVendaItemCODPESQUISA: TStringField;
    sdsNFVendaPES_CPFCNPJ: TStringField;
    sdsNFVendaPES_UF: TStringField;
    cdsNFVendaPES_CPFCNPJ: TStringField;
    cdsNFVendaPES_UF: TStringField;
    sdsNFVendaPES_CONTATOS: TStringField;
    sdsNFVendaPES_RAZAO_SOCIAL: TStringField;
    sdsNFVendaPES_ENDERECO: TStringField;
    sdsNFVendaPES_BAIRRO: TStringField;
    sdsNFVendaPES_CIDADE: TStringField;
    sdsNFVendaPES_CEP: TStringField;
    sdsNFVendaPES_TELEFONE: TStringField;
    sdsNFVendaCFOP_GERAFINANCEIRO: TStringField;
    sdsNFVendaPES_IE: TStringField;
    sdsNFVendaCFOP_CLASSIFICACAO: TStringField;
    sdsNFVendaCFOP_TIPO: TStringField;
    cdsNFVendaPES_CONTATOS: TStringField;
    cdsNFVendaPES_RAZAO_SOCIAL: TStringField;
    cdsNFVendaPES_ENDERECO: TStringField;
    cdsNFVendaPES_BAIRRO: TStringField;
    cdsNFVendaPES_CIDADE: TStringField;
    cdsNFVendaPES_CEP: TStringField;
    cdsNFVendaPES_TELEFONE: TStringField;
    cdsNFVendaCFOP_GERAFINANCEIRO: TStringField;
    cdsNFVendaPES_IE: TStringField;
    cdsNFVendaCFOP_CLASSIFICACAO: TStringField;
    cdsNFVendaCFOP_TIPO: TStringField;
    cdsNFVendatipo_x: TStringField;
    cdsNFVendaData_Saida: TDateField;
    cdsNFVendaCODNFVENDA_2: TIntegerField;
    cdsNFVendaCODSERIE_2: TStringField;
    cdsNFVendaData_Emissao_2: TDateField;
    cdsNFVendaHora: TTimeField;
    cdsNFVendaSelo_AA: TStringField;
    cdsNFVendaSERIE_COD_1: TStringField;
    cdsNFVendaSERIE_COD_2: TStringField;
    cdsNFVendatipo_x_entrada: TStringField;
    sdsNFVendaItemPRO_SI_TRIB_APOLO: TStringField;
    sdsNFVendaItemCLA_REFERENCIA: TStringField;
    cdsNFVendaItemPRO_SI_TRIB_APOLO: TStringField;
    cdsNFVendaItemCLA_REFERENCIA: TStringField;
    sdsNFVendaNFV_BAIXA_ESTOQUE: TStringField;
    cdsNFVendaNFV_BAIXA_ESTOQUE: TStringField;
    sdsNFVendaItemNFVI_NUMLOTE: TStringField;
    cdsNFVendaItemNFVI_NUMLOTE: TStringField;
    sdsNFVendaItemCODPEDVENDAITEM: TIntegerField;
    cdsNFVendaItemCODPEDVENDAITEM: TIntegerField;
    sdsNFVendaItemMAR_DESCRICAO: TStringField;
    cdsNFVendaItemMAR_DESCRICAO: TStringField;
    cdsNFVendaCNPJ_Empresa: TStringField;
    cdsNFVendaIE_Empresa: TStringField;
    cdsNFVendaRazaoSocial_Empresa: TStringField;
    sdsNFVendaItemNFVI_VALIDADE: TDateField;
    cdsNFVendaItemNFVI_VALIDADE: TDateField;
    sdsNFVendaItemNFVI_VLRDESC: TFloatField;
    cdsNFVendaItemNFVI_VLRDESC: TFloatField;
    sdsNFVendaItemNFVI_PERDESC: TFloatField;
    sdsNFVendaItemNFVI_TOTAL_DESCONTO: TFloatField;
    cdsNFVendaItemNFVI_PERDESC: TFloatField;
    cdsNFVendaItemNFVI_TOTAL_DESCONTO: TFloatField;
    sdsNFVendaPES_NOME_2: TStringField;
    cdsNFVendaPES_NOME_2: TStringField;
    sdsNFVendaPES_RAZAO_SOCIAL_2: TStringField;
    cdsNFVendaPES_RAZAO_SOCIAL_2: TStringField;
    cdsNFVendaauxDtEmissao: TDateField;
    sdsNFVendaItemPROC_SIGLA: TStringField;
    sdsNFVendaItemPROC_CODIGO: TStringField;
    cdsNFVendaItemPROC_SIGLA: TStringField;
    cdsNFVendaItemPROC_CODIGO: TStringField;
    sdsNFVendaItemPRO_TIPOLISTA: TStringField;
    cdsNFVendaItemPRO_TIPOLISTA: TStringField;
    sdsNFVendaNFV_ICMS_SUBST_BASE: TFloatField;
    sdsNFVendaNFV_ICMS_SUBST: TFloatField;
    cdsNFVendaNFV_ICMS_SUBST_BASE: TFloatField;
    cdsNFVendaNFV_ICMS_SUBST: TFloatField;
    sdsNFVendaItemPRO_REG_ICMS: TStringField;
    cdsNFVendaItemPRO_REG_ICMS: TStringField;
    sdsNFVendaPES_CONSUMIDOR_FINAL: TStringField;
    cdsNFVendaPES_CONSUMIDOR_FINAL: TStringField;
    sdsNFVendaFPG_DESCRICAO: TStringField;
    cdsNFVendaFPG_DESCRICAO: TStringField;
    cdsPesq_Contas: TClientDataSet;
    dspPesq_Contas: TDataSetProvider;
    sdsPesq_Contas: TSQLDataSet;
    sdsPesq_ContasCON_NUMDOC: TStringField;
    sdsPesq_ContasCON_PARCELA: TStringField;
    sdsPesq_ContasCON_VLRPARCELA: TFloatField;
    sdsPesq_ContasCON_VLRTOTAL: TFloatField;
    sdsPesq_ContasCON_DTVENC: TDateField;
    cdsPesq_ContasCON_NUMDOC: TStringField;
    cdsPesq_ContasCON_PARCELA: TStringField;
    cdsPesq_ContasCON_VLRPARCELA: TFloatField;
    cdsPesq_ContasCON_VLRTOTAL: TFloatField;
    cdsPesq_ContasCON_DTVENC: TDateField;
    sdsNFVendaNFV_IR_VLR: TFloatField;
    cdsNFVendaNFV_IR_VLR: TFloatField;
    sdsNFVendaNFV_NFE_NREC: TStringField;
    sdsNFVendaNFV_NFE_NPROT: TStringField;
    cdsNFVendaNFV_NFE_NREC: TStringField;
    cdsNFVendaNFV_NFE_NPROT: TStringField;
    sdsNFVendaNFV_XML_ENVIADO: TBlobField;
    sdsNFVendaNFV_XML_RETORNO: TBlobField;
    cdsNFVendaNFV_XML_ENVIADO: TBlobField;
    cdsNFVendaNFV_XML_RETORNO: TBlobField;
    sdsNFVendaNFV_XML_CANC_RETORNO: TBlobField;
    sdsNFVendaNFV_NFE_CANC_NPROT: TStringField;
    cdsNFVendaNFV_XML_CANC_RETORNO: TBlobField;
    cdsNFVendaNFV_NFE_CANC_NPROT: TStringField;
    sdsNFVendaNFV_DESCVLR: TFloatField;
    cdsNFVendaNFV_DESCVLR: TFloatField;
    sdsNFVendaNFV_TP_FRETE: TStringField;
    cdsNFVendaNFV_TP_FRETE: TStringField;
    sdsNFVendaCODTRANSPORTADORA: TIntegerField;
    sdsNFVendaTRA_RAZAO_SOCIAL: TStringField;
    sdsNFVendaTRA_NOME: TStringField;
    sdsNFVendaTRA_CPFCNPJ: TStringField;
    sdsNFVendaTRA_ENDERECO: TStringField;
    sdsNFVendaTRA_BAIRRO: TStringField;
    sdsNFVendaTRA_CIDADE: TStringField;
    sdsNFVendaTRA_UF: TStringField;
    sdsNFVendaTRA_IE: TStringField;
    cdsNFVendaCODTRANSPORTADORA: TIntegerField;
    cdsNFVendaTRA_RAZAO_SOCIAL: TStringField;
    cdsNFVendaTRA_NOME: TStringField;
    cdsNFVendaTRA_CPFCNPJ: TStringField;
    cdsNFVendaTRA_ENDERECO: TStringField;
    cdsNFVendaTRA_BAIRRO: TStringField;
    cdsNFVendaTRA_CIDADE: TStringField;
    cdsNFVendaTRA_UF: TStringField;
    cdsNFVendaTRA_IE: TStringField;
    sdsNFVendaNFV_QTD_VOL: TIntegerField;
    sdsNFVendaNFV_ESP: TStringField;
    sdsNFVendaNFV_MARCA: TStringField;
    sdsNFVendaNFV_PESO_BRUTO: TFloatField;
    sdsNFVendaNFV_PESO_LIQUIDO: TFloatField;
    cdsNFVendaNFV_QTD_VOL: TIntegerField;
    cdsNFVendaNFV_ESP: TStringField;
    cdsNFVendaNFV_MARCA: TStringField;
    cdsNFVendaNFV_PESO_BRUTO: TFloatField;
    cdsNFVendaNFV_PESO_LIQUIDO: TFloatField;
    sdsNFVendaNFV_NR_VOL: TStringField;
    cdsNFVendaNFV_NR_VOL: TStringField;
    sdsNFVendaItemPRO_NCM: TStringField;
    cdsNFVendaItemPRO_NCM: TStringField;
    sdsNFVendaNFV_UF_EMB: TStringField;
    sdsNFVendaNFV_LOCAL_EMB: TStringField;
    cdsNFVendaNFV_UF_EMB: TStringField;
    cdsNFVendaNFV_LOCAL_EMB: TStringField;
    sdsNFVendaNFV_ENTREGUE: TStringField;
    cdsNFVendaNFV_ENTREGUE: TStringField;
    sdsNFVendaItemPRODG_DESCRICAO: TStringField;
    cdsNFVendaItemPRODG_DESCRICAO: TStringField;
    sdsNFVendaItemNFVI_QTDE_ENTREGUE: TFloatField;
    cdsNFVendaItemNFVI_QTDE_ENTREGUE: TFloatField;
    cdsNFVendaItemQtdeNovaEntregue: TCurrencyField;
    sdsNFVendaItemPRO_ESTQ_ATUAL: TFloatField;
    cdsNFVendaItemPRO_ESTQ_ATUAL: TFloatField;
    sdsNFVendaItemPRO_CST: TStringField;
    cdsNFVendaItemPRO_CST: TStringField;
    sdsNFVendaCODVENDEDOR: TIntegerField;
    cdsNFVendaCODVENDEDOR: TIntegerField;
    sdsNFVendaVEN_NOME: TStringField;
    cdsNFVendaVEN_NOME: TStringField;
    sdsNFVendaSER_TIPO: TStringField;
    cdsNFVendaSER_TIPO: TStringField;
    sdsNFVendaPES_ENDERECO_NUMERO: TIntegerField;
    sdsNFVendaPES_ENDERECO_COMPLEMENTO: TStringField;
    sdsNFVendaPES_TELEFONE_DDD: TStringField;
    cdsNFVendaPES_ENDERECO_NUMERO: TIntegerField;
    cdsNFVendaPES_ENDERECO_COMPLEMENTO: TStringField;
    cdsNFVendaPES_TELEFONE_DDD: TStringField;
    sdsNFVendaItemNFVI_CATEGORIA: TStringField;
    sdsNFVendaItemCODSERVICO: TIntegerField;
    sdsNFVendaItemSER_DESCRICAO: TStringField;
    sdsNFVendaItemSERU_SIGLA: TStringField;
    cdsNFVendaItemNFVI_CATEGORIA: TStringField;
    cdsNFVendaItemCODSERVICO: TIntegerField;
    cdsNFVendaItemSER_DESCRICAO: TStringField;
    cdsNFVendaItemSERU_SIGLA: TStringField;
    cdsNFVendaItemAuxDescricao: TStringField;
    cdsNFVendaItemAuxCodProd: TStringField;
    cdsNFVendaItemAuxCodServ: TStringField;
    sdsNFVendaItemCODPRODUTOUNIDADE_NFVI: TIntegerField;
    sdsNFVendaItemNFVI_QTDE_UND: TFloatField;
    sdsNFVendaItemNFVI_VLR_UND: TFloatField;
    cdsNFVendaItemCODPRODUTOUNIDADE_NFVI: TIntegerField;
    cdsNFVendaItemNFVI_QTDE_UND: TFloatField;
    cdsNFVendaItemNFVI_VLR_UND: TFloatField;
    sdsUndProduto: TSimpleDataSet;
    sdsUndProdutoCODPRODUTOUNIDADE: TIntegerField;
    sdsUndProdutoPROU_SIGLA: TStringField;
    sdsUndProdutoQTDE: TFloatField;
    sdsNFVendaItemUND_COMP: TStringField;
    cdsNFVendaItemUND_COMP: TStringField;
    sdsNFVendaItemNFVI_UNIDADE: TStringField;
    cdsNFVendaItemNFVI_UNIDADE: TStringField;
    sdsNFVendaNFV_INSS_VLR: TFloatField;
    cdsNFVendaNFV_INSS_VLR: TFloatField;
    sdsNFVendaCCE: TSQLDataSet;
    dspNFVendaCCE: TDataSetProvider;
    cdsNFVendaCCE: TClientDataSet;
    sdsNFVendaCCECODNFVENDACCE: TIntegerField;
    sdsNFVendaCCECODNFVENDA: TIntegerField;
    sdsNFVendaCCECODSERIE: TStringField;
    sdsNFVendaCCENFVC_SEQUENCIAL: TIntegerField;
    sdsNFVendaCCENFVC_DATA: TSQLTimeStampField;
    sdsNFVendaCCENFVC_CORRECAO: TStringField;
    sdsNFVendaCCENFVC_XML_ENVIO: TBlobField;
    sdsNFVendaCCENFVC_XML_RECEBIDO: TBlobField;
    sdsNFVendaCCENFVC_STATUS: TStringField;
    sdsNFVendaCCENFVC_NPROT: TStringField;
    cdsNFVendaCCECODNFVENDACCE: TIntegerField;
    cdsNFVendaCCECODNFVENDA: TIntegerField;
    cdsNFVendaCCECODSERIE: TStringField;
    cdsNFVendaCCENFVC_SEQUENCIAL: TIntegerField;
    cdsNFVendaCCENFVC_DATA: TSQLTimeStampField;
    cdsNFVendaCCENFVC_CORRECAO: TStringField;
    cdsNFVendaCCENFVC_XML_ENVIO: TBlobField;
    cdsNFVendaCCENFVC_XML_RECEBIDO: TBlobField;
    cdsNFVendaCCENFVC_STATUS: TStringField;
    cdsNFVendaCCENFVC_NPROT: TStringField;
    sdsNFVendaCCENFVC_MOTIVO: TStringField;
    cdsNFVendaCCENFVC_MOTIVO: TStringField;
    sdsNFVendaItemNFVI_DI_COD_EXPORTADOR: TStringField;
    sdsNFVendaItemNFVI_DI_DATA_DESEMB: TDateField;
    sdsNFVendaItemNFVI_DI_DATA_REGISTRO: TDateField;
    sdsNFVendaItemNFVI_DI_LOCAL_DESEMB: TStringField;
    sdsNFVendaItemNFVI_DI_NUMERO: TStringField;
    sdsNFVendaItemNFVI_DI_UF_DESEMB: TStringField;
    cdsNFVendaItemNFVI_DI_COD_EXPORTADOR: TStringField;
    cdsNFVendaItemNFVI_DI_DATA_DESEMB: TDateField;
    cdsNFVendaItemNFVI_DI_DATA_REGISTRO: TDateField;
    cdsNFVendaItemNFVI_DI_LOCAL_DESEMB: TStringField;
    cdsNFVendaItemNFVI_DI_NUMERO: TStringField;
    cdsNFVendaItemNFVI_DI_UF_DESEMB: TStringField;
    sdsNFVendaItemNFVI_II_VLR: TFloatField;
    sdsNFVendaItemNFVI_II_BC: TFloatField;
    sdsNFVendaItemNFVI_II_DESP_ADUANEIRAS: TFloatField;
    sdsNFVendaItemNFVI_IOF_VLR: TFloatField;
    cdsNFVendaItemNFVI_II_VLR: TFloatField;
    cdsNFVendaItemNFVI_II_BC: TFloatField;
    cdsNFVendaItemNFVI_II_DESP_ADUANEIRAS: TFloatField;
    cdsNFVendaItemNFVI_IOF_VLR: TFloatField;
    sdsNFVendaItemCODFABRICANTE: TIntegerField;
    cdsNFVendaItemCODFABRICANTE: TIntegerField;
    sdsNFVendaItemNFVI_CST: TStringField;
    sdsNFVendaItemNFVI_SUBST_BC: TFloatField;
    sdsNFVendaItemNFVI_SUBST_VLR: TFloatField;
    cdsNFVendaItemNFVI_CST: TStringField;
    cdsNFVendaItemNFVI_SUBST_BC: TFloatField;
    cdsNFVendaItemNFVI_SUBST_VLR: TFloatField;
    sdsUndServico: TSimpleDataSet;
    sdsUndServicoCODSERVICO: TIntegerField;
    sdsUndServicoPROU_SIGLA: TStringField;
    dsUndComp: TDataSource;
    sdsUndServicoCODPRODUTOUNIDADE: TIntegerField;
    sdsNFVendaItemCODLICITACAOCONTRATOITEM: TIntegerField;
    cdsNFVendaItemCODLICITACAOCONTRATOITEM: TIntegerField;
    sdsNFVendaItemNFVI_ICMS_BASE: TFloatField;
    cdsNFVendaItemNFVI_ICMS_BASE: TFloatField;
    sdsNFVendaItemCODLICITACAOCONTRATO: TIntegerField;
    sdsNFVendaItemLICCI_DATA_INICIO: TDateField;
    sdsNFVendaItemLICCI_DATA_VALIDADE: TDateField;
    sdsNFVendaItemLICCI_PRAZO_ENTREGA: TIntegerField;
    sdsNFVendaItemLICCI_PROCESSO: TStringField;
    sdsNFVendaItemLICCI_QTDE: TFloatField;
    sdsNFVendaItemLICCI_QTDE_FAT: TFloatField;
    sdsNFVendaItemLICCI_QTDE_LIMITE: TFloatField;
    sdsNFVendaItemLICCI_TIPO_PROCESSO: TStringField;
    sdsNFVendaItemLICCI_VLRUNIT: TFloatField;
    cdsNFVendaItemCODLICITACAOCONTRATO: TIntegerField;
    cdsNFVendaItemLICCI_DATA_INICIO: TDateField;
    cdsNFVendaItemLICCI_DATA_VALIDADE: TDateField;
    cdsNFVendaItemLICCI_PRAZO_ENTREGA: TIntegerField;
    cdsNFVendaItemLICCI_PROCESSO: TStringField;
    cdsNFVendaItemLICCI_QTDE: TFloatField;
    cdsNFVendaItemLICCI_QTDE_FAT: TFloatField;
    cdsNFVendaItemLICCI_QTDE_LIMITE: TFloatField;
    cdsNFVendaItemLICCI_TIPO_PROCESSO: TStringField;
    cdsNFVendaItemLICCI_VLRUNIT: TFloatField;
    sdsNFVendaItemCODCFOP: TStringField;
    sdsNFVendaItemCFOP_DESCRICAO: TStringField;
    cdsNFVendaItemCODCFOP: TStringField;
    cdsNFVendaItemCFOP_DESCRICAO: TStringField;
    sdsNFVendaItemNFVI_MOD_BC: TStringField;
    cdsNFVendaItemNFVI_MOD_BC: TStringField;
    sdsNFVendaNFV_ACRESCIMO: TFloatField;
    cdsNFVendaNFV_ACRESCIMO: TFloatField;
    sdsNFVendaPES_END_RUA_NUM_COMPL: TStringField;
    cdsNFVendaPES_END_RUA_NUM_COMPL: TStringField;
    sdsNFVendaPES_NOME_RAZAO: TStringField;
    cdsNFVendaPES_NOME_RAZAO: TStringField;
    sdsNFVendaNFV_FINALIDADE_EMISSAO: TStringField;
    cdsNFVendaNFV_FINALIDADE_EMISSAO: TStringField;
    sdsNFVendaNFV_RECEB_NOME: TStringField;
    sdsNFVendaNFV_RECEB_RG: TStringField;
    sdsNFVendaNFV_RECEB_DATA: TDateField;
    sdsNFVendaNFV_RECEB_HORA: TTimeField;
    cdsNFVendaNFV_RECEB_NOME: TStringField;
    cdsNFVendaNFV_RECEB_RG: TStringField;
    cdsNFVendaNFV_RECEB_DATA: TDateField;
    cdsNFVendaNFV_RECEB_HORA: TTimeField;
    sdsNFVendaCODNFVENDA_DEV: TIntegerField;
    sdsNFVendaCODSERIE_DEV: TStringField;
    cdsNFVendaCODNFVENDA_DEV: TIntegerField;
    cdsNFVendaCODSERIE_DEV: TStringField;
    sdsNFVendaItemNFVI_CST_IPI: TStringField;
    sdsNFVendaItemNFVI_ALTERAR_IPI: TStringField;
    cdsNFVendaItemNFVI_CST_IPI: TStringField;
    cdsNFVendaItemNFVI_ALTERAR_IPI: TStringField;
    sdsNFVendaItemNFVI_PIS_VLR: TFloatField;
    sdsNFVendaItemNFVI_PIS_PER: TFloatField;
    sdsNFVendaItemNFVI_PIS_CST: TStringField;
    sdsNFVendaItemNFVI_COFINS_VLR: TFloatField;
    sdsNFVendaItemNFVI_COFINS_PER: TFloatField;
    sdsNFVendaItemNFVI_COFINS_CST: TStringField;
    cdsNFVendaItemNFVI_PIS_VLR: TFloatField;
    cdsNFVendaItemNFVI_PIS_PER: TFloatField;
    cdsNFVendaItemNFVI_PIS_CST: TStringField;
    cdsNFVendaItemNFVI_COFINS_VLR: TFloatField;
    cdsNFVendaItemNFVI_COFINS_PER: TFloatField;
    cdsNFVendaItemNFVI_COFINS_CST: TStringField;
    sdsNFVendaItemNFVI_COFINS_BC: TFloatField;
    sdsNFVendaItemNFVI_PIS_BC: TFloatField;
    cdsNFVendaItemNFVI_COFINS_BC: TFloatField;
    cdsNFVendaItemNFVI_PIS_BC: TFloatField;
    pesq_NFVenda: Td2kPesquisa;
    sdsNFVendaCODPARGERAL: TIntegerField;
    cdsNFVendaCODPARGERAL: TIntegerField;
    sdsNFVendaItemNFVI_TIPOPRECO: TStringField;
    cdsNFVendaItemNFVI_TIPOPRECO: TStringField;
    sdsNFVendaPES_EMAIL: TStringField;
    cdsNFVendaPES_EMAIL: TStringField;
    sdsNFVendaItemNFVI_PER_REDUC: TFloatField;
    cdsNFVendaItemNFVI_PER_REDUC: TFloatField;
    sdsNFVendaItemPRO_ESTQ_RESERVADO: TFloatField;
    cdsNFVendaItemPRO_ESTQ_RESERVADO: TFloatField;
    sdsNFVendaPES_EMAIL_NFE: TStringField;
    cdsNFVendaPES_EMAIL_NFE: TStringField;
    sdsNFVendaCODNFCOMPRA_DEV: TIntegerField;
    cdsNFVendaCODNFCOMPRA_DEV: TIntegerField;
    cdsNFVendaauxNF: TStringField;
    sdsNFVendaItemNFVI_CSOSN: TStringField;
    cdsNFVendaItemNFVI_CSOSN: TStringField;
    sdsNFVendaItemNFVI_CUSTO_PRODUTO: TFloatField;
    cdsNFVendaItemNFVI_CUSTO_PRODUTO: TFloatField;
    sdsNFVendaItemNFVI_PRECO_COMPRA: TFloatField;
    cdsNFVendaItemNFVI_PRECO_COMPRA: TFloatField;
    sdsNFVendaItemFORNECEDOR_NOME: TStringField;
    sdsNFVendaItemCODPESSOA_FORNECEDOR: TIntegerField;
    cdsNFVendaItemFORNECEDOR_NOME: TStringField;
    cdsNFVendaItemCODPESSOA_FORNECEDOR: TIntegerField;
    sdsNFVendaServico: TSQLDataSet;
    sdsNFVendaServicoCODNFVENDASERVICO: TIntegerField;
    sdsNFVendaServicoCODNFVENDA: TIntegerField;
    sdsNFVendaServicoCODSERIE: TStringField;
    sdsNFVendaServicoNFVS_VLR_UNITARIO: TFloatField;
    sdsNFVendaServicoNFVS_QTDE: TFloatField;
    sdsNFVendaServicoNFVS_TOTAL: TFloatField;
    sdsNFVendaServicoNFVS_DESCRICAO: TStringField;
    sdsNFVendaServicoNFVS_UNIDADE: TStringField;
    dspNFVendaServico: TDataSetProvider;
    cdsNFVendaServico: TClientDataSet;
    cdsNFVendaServicoCODNFVENDASERVICO: TIntegerField;
    cdsNFVendaServicoCODNFVENDA: TIntegerField;
    cdsNFVendaServicoCODSERIE: TStringField;
    cdsNFVendaServicoNFVS_DESCRICAO: TStringField;
    cdsNFVendaServicoNFVS_QTDE: TFloatField;
    cdsNFVendaServicoNFVS_VLR_UNITARIO: TFloatField;
    cdsNFVendaServicoNFVS_TOTAL: TFloatField;
    cdsNFVendaServicoNFVS_UNIDADE: TStringField;
    sdsNFVendaNFV_REFNFE: TStringField;
    cdsNFVendaNFV_REFNFE: TStringField;
    sdsNFVendaNFV_NFE_EMISSAO: TSQLTimeStampField;
    cdsNFVendaNFV_NFE_EMISSAO: TSQLTimeStampField;
    sdsNFVendaItemNFVI_ALIQ_ICMS_FORA: TFloatField;
    cdsNFVendaItemNFVI_ALIQ_ICMS_FORA: TFloatField;
    sdsNFVendaCODPEDECF: TIntegerField;
    cdsNFVendaCODPEDECF: TIntegerField;
    sdsPedEcfPesq: TSimpleDataSet;
    sdsPedEcfPesqCODPEDECF: TIntegerField;
    sdsPedEcfPesqPECF_DATA: TSQLTimeStampField;
    sdsPedEcfPesqPECF_STATUS: TStringField;
    sdsPedEcfPesqPES_NOME: TStringField;
    sdsPedEcfPesqPECF_COO: TStringField;
    sdsPedEcfPesqPECF_CCF: TStringField;
    sdsPedEcfPesqPECF_TOTAL: TFloatField;
    pesq_PedEcf: Td2kPesquisa;
    sdsNFVendaNFV_PLACA: TStringField;
    sdsNFVendaNFV_PLACA_UF: TStringField;
    cdsNFVendaNFV_PLACA: TStringField;
    cdsNFVendaNFV_PLACA_UF: TStringField;
    sdsNFVendaCODCAIXAABERTURA: TIntegerField;
    cdsNFVendaCODCAIXAABERTURA: TIntegerField;
    sdsNFVendaItemNFVI_CEST: TStringField;
    cdsNFVendaItemNFVI_CEST: TStringField;
    sdsNFVendaItemNFVI_FCP_ALIQ: TFloatField;
    cdsNFVendaItemNFVI_FCP_ALIQ: TFloatField;
    sdsContasParcela: TSimpleDataSet;
    sdsContasParcelaMOE_NFE_PAG: TStringField;
    sdsContasParcelaMOE_NFE_BAND: TStringField;
    sdsContasParcelaMOE_NFE_INTEGRADO: TStringField;
    sdsContasParcelaCON_VLRPARCELA: TFloatField;
    sdsNFVendaItemPRO_EAN13: TStringField;
    cdsNFVendaItemPRO_EAN13: TStringField;
    procedure cdsNFVendaItemNFVI_PIS_BCValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_COFINS_BCValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_COFINS_PERValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_PIS_PERValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_ALIQ_IPIValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_ALIQ_ICMSValidate(Sender: TField);
    procedure cdsNFVendaServicoNFVS_VLR_UNITARIOValidate(Sender: TField);
    procedure cdsNFVendaServicoNFVS_QTDEValidate(Sender: TField);
    procedure cdsNFVendaServicoBeforePost(DataSet: TDataSet);
    procedure cdsNFVendaServicoNewRecord(DataSet: TDataSet);
    procedure cdsNFVendaItemCODPESSOA_FORNECEDORValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_PER_REDUCValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_TIPOPRECOValidate(Sender: TField);
    procedure cdsNFVendaItemAfterPost(DataSet: TDataSet);
    procedure cdsNFVendaNFV_ACRESCIMOValidate(Sender: TField);
    procedure cdsNFVendaItemCODCFOPValidate(Sender: TField);
    procedure cdsNFVendaItemCODLICITACAOCONTRATOITEMValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_ICMS_BASEValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_CATEGORIAValidate(Sender: TField);
    procedure cdsNFVendaItemCODPRODUTOValidate(Sender: TField);
    procedure cdsNFVendaCCENewRecord(DataSet: TDataSet);
    procedure cdsNFVendaItemNFVI_VLR_UNDValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_QTDE_UNDValidate(Sender: TField);
    procedure cdsNFVendaItemCODPRODUTOUNIDADE_NFVIValidate(Sender: TField);
    procedure cdsNFVendaItemCODSERVICOValidate(Sender: TField);
    procedure cdsNFVendaItemCalcFields(DataSet: TDataSet);
    procedure cdsNFVendaCODVENDEDORValidate(Sender: TField);
    procedure cdsNFVendaItemQtdeNovaEntregueValidate(Sender: TField);
    procedure cdsNFVendaNFV_TP_FRETEValidate(Sender: TField);
    procedure cdsNFVendaCODTRANSPORTADORAValidate(Sender: TField);
    procedure cdsNFVendaNFV_DESCVLRValidate(Sender: TField);
    procedure cdsNFVendaNFV_FRETEValidate(Sender: TField);
    procedure cdsNFVendaNFV_IR_PERCValidate(Sender: TField);
    procedure cdsNFVendaNFV_ISS_ALIQValidate(Sender: TField);
    procedure cdsNFVendaItemPRO_TIPOLISTAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsNFVendaItemNFVI_PERDESCValidate(Sender: TField);
    procedure cdsNFVendaItemNFVI_VLRDESCValidate(Sender: TField);
    procedure cdsNFVendaCalcFields(DataSet: TDataSet);
    procedure cdsNFVendaItemNFVI_VLR_UNITARIOValidate(Sender: TField);
    procedure cdsNFVendaItemCODPESQUISAValidate(Sender: TField);
    procedure cdsNFVendaCODSERIEValidate(Sender: TField);
    procedure cdsNFVendaAfterOpen(DataSet: TDataSet);
    procedure cdsNFVendaAfterClose(DataSet: TDataSet);
    procedure cdsNFVendaCODCFOPValidate(Sender: TField);
    procedure cdsNFVendaCODPESSOAValidate(Sender: TField);
    procedure cdsNFVendaItemNewRecord(DataSet: TDataSet);
    procedure cdsNFVendaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    TIPO_ANTERIOR: string;
  public
    { Public declarations }
    procedure NFVENDA_CALC_DESC_PERC(Verificar: Boolean = False);
    procedure NFVENDAITEM_CalcularTotal;
    procedure NFVENDAITEM_CalcularTotal_IPIICMS;
    procedure NFVENDA_CalcularTotal;
    function NFVENDA_Faturar: Boolean;
    function NFVENDAITEM_TotalItem: Currency;
    procedure NFVendaItem_CalculaUnidade;
    //
    procedure NFE_Cofigure(CODNFVENDA: Integer; CODSERIE: string; CODPESSOA: Integer);
    function GetChaveAcesso: string;
    procedure NFE_Imprimir(CODNFVENDA: Integer; CODSERIE: string; CODPESSOA: Integer; bPDF: Boolean = false);
    procedure NFE_GerarDados(AObsAdd: Integer; vlr: string = ''; percent: string = '');
    function NFVENDA_Faturar_Pergunta(ACODNFVENDA: Integer; ACODSERIE: string; pTipo: string; AReabrirRegistro: Boolean = True): Boolean;
    //
    function temProdutoSemEstoque(pCodNF: Integer; pCodSerie: string; pTipo: string; AReabrirRegistro: Boolean = True): Boolean;
    procedure CalcularTotalNFVENDASERVICO;
    procedure ValidaCfop;
    procedure gerarInstance;
  end;

var
  dmNFVenda: TdmNFVenda;

implementation

uses DAcesso, DParametro, DCfop, LibGeral,
  DFormaDePagamento, UContasFechamento
{$IFDEF APOLO}
  , DTributacaoUF
{$ENDIF}
  , DConfiguracao, DAberturaCaixa, DVendedor
{$IFNDEF PKGSSM}
  , DServico, DNFCompra
{$ENDIF}
  , DPessoa,
  DNfe, DProduto, UNFVendaItem
{$IFDEF MINOTAURO}
  , ULocalizarContratoLicitacaoItem
{$ENDIF}
{$IFDEF PKGSSM}
{$ELSE}
  , DPesquisa
{$IFNDEF PARKING}
{$IFNDEF TRANSPORTEESCOLAR}
  , DLicitacaoContrato
{$ENDIF}
{$ENDIF}
{$ENDIF}
  , DSerie, UObsAdd, pcnNFe, ACBrNFeWebServices, USenha;

{$R *.dfm}

procedure TdmNFVenda.CalcularTotalNFVENDASERVICO;
begin
  cdsNFVendaServicoNFVS_TOTAL.AsCurrency :=
    cdsNFVendaServicoNFVS_VLR_UNITARIO.AsCurrency * cdsNFVendaServicoNFVS_QTDE.AsCurrency;
end;

procedure TdmNFVenda.cdsNFVendaAfterClose(DataSet: TDataSet);
begin
  cdsNFVendaServico.Close;
  cdsNFVendaItem.Close;
  cdsNFVendaCCE.Close;
end;

procedure TdmNFVenda.cdsNFVendaAfterOpen(DataSet: TDataSet);
begin
  cdsNFVendaItem.Close;
  cdsNFVendaItem.Params[0].AsInteger := cdsNFVendaCODNFVENDA.AsInteger;
  cdsNFVendaItem.Params[1].AsString := cdsNFVendaCODSERIE.AsString;
  cdsNFVendaItem.Open;

  cdsNFVendaCCE.Close;
  cdsNFVendaCCE.Params[0].AsInteger := cdsNFVendaCODNFVENDA.AsInteger;
  cdsNFVendaCCE.Params[1].AsString := cdsNFVendaCODSERIE.AsString;
  cdsNFVendaCCE.Open;

  cdsNFVendaServico.Close;
  cdsNFVendaServico.Params[0].AsInteger := cdsNFVendaCODNFVENDA.AsInteger;
  cdsNFVendaServico.Params[1].AsString := cdsNFVendaCODSERIE.AsString;
  cdsNFVendaServico.Open;
end;

procedure TdmNFVenda.cdsNFVendaCalcFields(DataSet: TDataSet);
begin
  cdsNFVendatipo_x.AsString := 'X';
  cdsNFVendatipo_x_entrada.AsString := 'X';

  if cdsNFVendaNFV_TIPO.AsString = 'E' then
    cdsNFVendatipo_x.Value := ' '
  else
    cdsNFVendatipo_x_entrada.AsString := ' ';

  cdsNFVendaCODSERIE_2.AsString := cdsNFVendaCODSERIE.AsString;
  cdsNFVendaData_Saida.AsDateTime := cdsNFVendaNFV_DTEMISSAO.AsDateTime;
  cdsNFVendaCODNFVENDA_2.AsString := cdsNFVendaCODNFVENDA.AsString;
  cdsNFVendaData_Emissao_2.AsDateTime := cdsNFVendaNFV_DTEMISSAO.AsDateTime;
  cdsNFVendaHora.Value := time;
  cdsNFVendaSelo_AA.AsString := 'AA';

  cdsNFVendaSERIE_COD_1.AsString := 'Série: ' + cdsNFVendaCODSERIE.AsString;
  cdsNFVendaSERIE_COD_2.AsString := 'Série: ' + cdsNFVendaCODSERIE.AsString;

  cdsNFVendaCNPJ_Empresa.AsString := dmAcesso.cdsParGeralPARG_CPFCGC.AsString;
  cdsNFVendaIE_Empresa.AsString := dmAcesso.cdsParGeralPARG_IE.AsString;
  cdsNFVendaRazaoSocial_Empresa.AsString := dmAcesso.cdsParGeralPARG_EMPRESA.AsString;
  cdsNFVendaauxDtEmissao.AsDateTime := cdsNFVendaNFV_DTEMISSAO.AsDateTime;

  if (cdsNFVendaCODNFVENDA_DEV.AsInteger > 0) then
    cdsNFVendaauxNF.AsString := cdsNFVendaCODNFVENDA_DEV.AsString
  else if (cdsNFVendaCODNFCOMPRA_DEV.AsInteger > 0) then
    cdsNFVendaauxNF.AsString := cdsNFVendaCODNFCOMPRA_DEV.AsString
  else
    cdsNFVendaauxNF.AsString := '';
end;

procedure TdmNFVenda.cdsNFVendaCCENewRecord(DataSet: TDataSet);
  function IncrementSequencial(Tabela, Campo, Where: string): Integer;
  var
    scds: TSimpleDataSet;
  begin
    scds := TSimpleDataSet.Create(Self);
    try
      with scds do
      begin
        Connection := dmAcesso.sqlCon;
        DataSet.CommandText := 'SELECT COUNT(' + Campo + ') FROM ' + Tabela;
        if Where <> '' then
          DataSet.CommandText := DataSet.CommandText + ' WHERE ' + Where;
        Open;
        if IsEmpty then
          Result := 1
        else
          Result := Fields[0].AsInteger + 1;
      end;
    finally
      scds.Free;
    end;
  end;
var
  seq: Integer;
begin
  seq :=
    IncrementSequencial(
    'NFVENDA_CCE',
    'CODNFVENDACCE',
    ' CODNFVENDA = ' + cdsNFVendaCODNFVENDA.AsString + ' AND ' +
    ' CODSERIE = ' + cdsNFVendaCODSERIE.AsString);
  //
  cdsNFVendaCCECODNFVENDA.AsInteger := cdsNFVendaCODNFVENDA.AsInteger;
  cdsNFVendaCCECODSERIE.AsString := cdsNFVendaCODSERIE.AsString;
  cdsNFVendaCCENFVC_SEQUENCIAL.AsInteger := seq;
  cdsNFVendaCCENFVC_DATA.AsDateTime := Now;
end;

procedure TdmNFVenda.cdsNFVendaCODCFOPValidate(Sender: TField);
begin
  if Sender.AsString = '' then
  begin
    cdsNFVendaCFOP_DESCRICAO.Clear;
    cdsNFVendaCFOP_GERAFINANCEIRO.Clear;
    cdsNFVendaCFOP_CLASSIFICACAO.Clear;
    cdsNFVendaCFOP_TIPO.Clear;
  end
  else
  begin
    if dmCfop.pesq_Cfop.Localizar(Sender.AsString) then
    begin
      dmCfop.pesq_Cfop.Complementar([
        cdsNFVendaCFOP_DESCRICAO,
          cdsNFVendaCFOP_GERAFINANCEIRO,
          cdsNFVendaCFOP_CLASSIFICACAO,
          cdsNFVendaCFOP_TIPO,
          cdsNFVendaNFV_TIPO
          ]);
      //
      if not cdsNFVendaItem.IsEmpty then
      begin
        if dmAcesso.d2kReator.Funcoes.Win.Confirma('Deseja alterar o CFOP dos itens?', False) then
        begin
          cdsNFVendaItem.First;
          while not (cdsNFVendaItem.Eof) do
          begin
            //if (trim(cdsNFVendaItemCODCFOP.AsString) = '') then
            //begin
            cdsNFVendaItem.Edit;
            cdsNFVendaItemCODCFOP.AsString := cdsNFVendaCODCFOP.AsString;
            cdsNFVendaItem.Post;
            //end;
            //
            cdsNFVendaItem.Next;
          end;
          cdsNFVendaItem.First;
        end;
      end;
      //
      ValidaCfop;
    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaCODPESSOAValidate(Sender: TField);
var vCodPessoa: Integer;
begin
  if Sender.AsString = '' then
  begin
    cdsNFVendaPES_NOME.Clear;
    cdsNFVendaPES_CPFCNPJ.Clear;
    cdsNFVendaPES_UF.Clear;
    cdsNFVendaPES_CONTATOS.Clear;
    cdsNFVendaPES_RAZAO_SOCIAL.Clear;
    cdsNFVendaPES_ENDERECO.Clear;
    cdsNFVendaPES_BAIRRO.Clear;
    cdsNFVendaPES_CIDADE.Clear;
    cdsNFVendaPES_CEP.Clear;
    cdsNFVendaPES_TELEFONE.Clear;
    cdsNFVendaPES_IE.Clear;
    cdsNFVendaPES_NOME_2.Clear;
    cdsNFVendaPES_EMAIL.Clear;
    cdsNFVendaPES_EMAIL_NFE.Clear;
  end
  else
  begin
    if dmPessoa.pesq_Pessoa_All_Cli.Localizar(Sender.AsString) then
    begin
      dmPessoa.pesq_Pessoa_All_Cli.Complementar([cdsNFVendaPES_NOME,
        cdsNFVendaPES_CPFCNPJ,
          cdsNFVendaPES_CONTATOS,
          cdsNFVendaPES_RAZAO_SOCIAL,
          cdsNFVendaPES_ENDERECO,
          cdsNFVendaPES_BAIRRO,
          cdsNFVendaPES_CIDADE,
          cdsNFVendaPES_UF,
          cdsNFVendaPES_CEP,
          cdsNFVendaPES_TELEFONE,
          cdsNFVendaPES_IE,
          cdsNFVendaPES_NOME_2,
          cdsNFVendaPES_EMAIL,
          cdsNFVendaPES_EMAIL_NFE
          ]);
      vCodPessoa := cdsNFVendaCODPESSOA.asInteger;
      //
      ValidaCfop;
    end;
    //
    dmAcesso.sqlVariant.Close;
    dmAcesso.sqlVariant.CommandText := ' SELECT '
      + ' CODTRANSPORTADORA '
      + ' from PESSOA '
      + ' where CODPESSOA = ' + IntToStr(vCodPessoa);
//    + ' where CODPESSOA = ' + cdsNFVendaCODPESSOA.AsString;
    dmAcesso.sqlVariant.Open;
    //
    if dmAcesso.sqlVariant.Fields[0].AsInteger <> 0 then
      cdsNFVendaCODTRANSPORTADORA.AsInteger :=
        dmAcesso.sqlVariant.Fields[0].AsInteger;
  end;
end;

procedure TdmNFVenda.cdsNFVendaCODSERIEValidate(Sender: TField);
var
  DataSet: TDataSet;
begin
  if cdsNFVenda.State in [dsInsert] then
  begin
    if Trim(cdsNFVendaCODSERIE.AsString) = '' then
      raise Exception.Create('Você precisa informa uma Série para essa nota fiscal')
    else
    begin
      DataSet := MontarDataSet('SERIE',
        'CODSERIE',
        cdsNFVendaCODSERIE.AsString,
        3,
        DMAcesso.sqlCon);

      cdsNFVendaCODNFVENDA.AsInteger := DataSet.FieldByName('SER_SEQ').AsInteger;
      cdsNFVendaSER_TIPO.AsString := DataSet.FieldByName('SER_TIPO').AsString;

      if not cdsNFVendaItem.IsEmpty then
      begin
        cdsNFVendaItem.First;
        while not (cdsNFVendaItem.Eof) do
        begin
          cdsNFVendaItem.Edit;
          cdsNFVendaItemCODNFVENDA.AsInteger := cdsNFVendaCODNFVENDA.AsInteger;
          cdsNFVendaItemCODSERIE.AsString := cdsNFVendaCODSERIE.AsString;
          cdsNFVendaItem.Post;
          cdsNFVendaItem.Next;
        end;
      end;
    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaCODTRANSPORTADORAValidate(Sender: TField);
begin
  if Sender.AsString = '' then
  begin
    cdsNFVendaTRA_RAZAO_SOCIAL.Clear;
    cdsNFVendaTRA_NOME.Clear;
    cdsNFVendaTRA_CPFCNPJ.Clear;
    cdsNFVendaTRA_ENDERECO.Clear;
    cdsNFVendaTRA_BAIRRO.Clear;
    cdsNFVendaTRA_CIDADE.Clear;
    cdsNFVendaTRA_UF.Clear;
    cdsNFVendaTRA_IE.Clear;
  end
  else
  begin
    if dmPessoa.pesq_Pessoa_Tra.Localizar(Sender.AsString) then
    begin
      dmPessoa.pesq_Pessoa_Tra.Complementar([
        cdsNFVendaTRA_RAZAO_SOCIAL,
          cdsNFVendaTRA_NOME,
          cdsNFVendaTRA_CPFCNPJ,
          cdsNFVendaTRA_ENDERECO,
          cdsNFVendaTRA_BAIRRO,
          cdsNFVendaTRA_CIDADE,
          cdsNFVendaTRA_UF,
          cdsNFVendaTRA_IE]);
    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaCODVENDEDORValidate(Sender: TField);
begin
  inherited;
  if Sender.AsString = '' then
    cdsNFVendaVEN_NOME.Clear
  else
  begin
    if dmVendedor.pesq_Vendedor.Localizar(Sender.AsString) then
    begin
      dmVendedor.pesq_Vendedor.Complementar([
        cdsNFVendaVEN_NOME
          ]);

    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemAfterPost(DataSet: TDataSet);
begin
  TIPO_ANTERIOR := cdsNFVendaItemNFVI_TIPOPRECO.AsString;
end;

procedure TdmNFVenda.cdsNFVendaItemCalcFields(DataSet: TDataSet);
begin
  inherited;

  if (cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Produto')
    and (cdsNFVendaItemCODPRODUTO.AsInteger > 0) then
  begin
    cdsNfVendaItemAuxDescricao.AsString := cdsNFVendaItemPRO_DESCRICAO.AsString;
    cdsNFVendaItemAuxCodProd.AsString := cdsNFVendaItemCODPRODUTO.AsString;
    cdsNFVendaItemAuxCodProd.visible := True;

  end

  else if (cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Serviço')
    and (cdsNFVendaItemCODSERVICO.AsInteger > 0) then
  begin
    cdsNFVendaItemAuxDescricao.AsString := cdsNFVendaItemSER_DESCRICAO.AsString;
    cdsNFVendaItemAuxCodServ.AsString := cdsNFVendaItemCODSERVICO.AsString;
    cdsNFVendaItemAuxCodServ.visible := True;
  end;

end;

procedure TdmNFVenda.cdsNFVendaItemCODCFOPValidate(Sender: TField);
begin
  if Sender.AsString = '' then
    cdsNFVendaItemCFOP_DESCRICAO.Clear
  else
  begin
    if dmCfop.pesq_Cfop.Localizar(Sender.AsString) then
      dmCfop.pesq_Cfop.Complementar([
        cdsNFVendaItemCFOP_DESCRICAO
          ]);
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemCODLICITACAOCONTRATOITEMValidate(
  Sender: TField);
begin
  inherited;
  if (Sender.AsInteger <= 0) then
  begin
    cdsNFVendaItemLICCI_DATA_INICIO.Clear;
    cdsNFVendaItemLICCI_DATA_VALIDADE.Clear;
    cdsNFVendaItemLICCI_PRAZO_ENTREGA.Clear;
    cdsNFVendaItemLICCI_PROCESSO.Clear;
    cdsNFVendaItemLICCI_QTDE.Clear;
    cdsNFVendaItemLICCI_QTDE_FAT.Clear;
    cdsNFVendaItemLICCI_QTDE_LIMITE.Clear;
    cdsNFVendaItemLICCI_TIPO_PROCESSO.Clear;
    cdsNFVendaItemLICCI_VLRUNIT.Clear;
    cdsNFVendaItemCODLICITACAOCONTRATO.Clear;
  end
  else
  begin
{$IFDEF PKGSSM}
{$ELSE}
{$IFNDEF PARKING}
{$IFNDEF TRANSPORTEESCOLAR}
    if dmLicitacaoContrato.pesq_ContratoItem.Localizar(Sender.AsString) then
    begin
      dmLicitacaoContrato.pesq_ContratoItem.Complementar([
        cdsNFVendaItemLICCI_DATA_INICIO,
          cdsNFVendaItemLICCI_DATA_VALIDADE,
          cdsNFVendaItemLICCI_PRAZO_ENTREGA,
          cdsNFVendaItemLICCI_PROCESSO,
          cdsNFVendaItemLICCI_QTDE,
          cdsNFVendaItemLICCI_QTDE_FAT,
          cdsNFVendaItemLICCI_QTDE_LIMITE,
          cdsNFVendaItemLICCI_TIPO_PROCESSO,
          cdsNFVendaItemLICCI_VLRUNIT,
          cdsNFVendaItemCODLICITACAOCONTRATO
          ]);
    end;
{$ENDIF}
{$ENDIF}
{$ENDIF}
  end;

end;

procedure TdmNFVenda.cdsNFVendaItemCODPESQUISAValidate(Sender: TField);
begin
  if Sender.AsString = '' then
  begin
    cdsNFVendaItemPRO_DESCRICAO.Clear;
    cdsNFVendaItemCODPRODUTO.Clear;
    cdsNFVendaItemCODLICITACAOCONTRATOITEM.Clear;
  end
  else
  begin
    cdsNFVendaItemCODPRODUTO.Clear;
    cdsNFVendaItemNFVI_VLR_UNITARIO.Clear;
    cdsNFVendaItemNFVI_TOTAL.Clear;
    cdsNFVendaItemNFVI_QTDE_UND.Clear;
    cdsNFVendaItemNFVI_VLR_UND.Clear;
    cdsNFVendaItemCODPRODUTOUNIDADE_NFVI.Origin := 'CODPRODUTOUNIDADE';
{$IFDEF IRIS}
    if dmPesquisa.pesq_ProdutoIris.Localizar(Sender.AsString) then
    begin
      dmPesquisa.pesq_ProdutoIris.Complementar([
        cdsNFVendaItemPRO_DESCRICAO,
          cdsNFVendaItemCODPRODUTO,
          cdsNFVendaItemPRO_NCM,
          cdsNFVendaItemPRODG_DESCRICAO]);
    end;
{$ELSE}
    dmProduto.pesq_Produto_Venda.FieldKey := 'PRO_CODPESQ_1';
    if dmProduto.pesq_Produto_Venda.Localizar(Sender.AsString) then
    begin
      dmProduto.pesq_Produto_Venda.Complementar([
        cdsNFVendaItemPRO_DESCRICAO,
          cdsNFVendaItemCODPRODUTO,
          //cdsNFVendaItemNFVI_NUMLOTE,
          //cdsNFVendaItemNFVI_VALIDADE,
        cdsNFVendaItemNFVI_VLR_UNITARIO
          ]);
      if dmProduto.pesq_Produto.Localizar(Sender.AsString) then
        dmProduto.pesq_Produto.Complementar([
          cdsNFVendaItemNFVI_ALIQ_ICMS,
            cdsNFVendaItemMAR_DESCRICAO,
            cdsNFVendaItemPRO_REG_ICMS,
            cdsNFVendaItemPRO_TIPOLISTA,
            cdsNFVendaItemNFVI_VLR_UNITARIO,
            cdsNFVendaItemPRO_NCM,
            cdsNFVendaItemPRO_ESTQ_RESERVADO,
            cdsNFVendaItemPRO_ESTQ_ATUAL,
            cdsNFVendaItemNFVI_CUSTO_PRODUTO,
            cdsNFVendaItemNFVI_PRECO_COMPRA,
            cdsNFVendaItemNFVI_CSOSN,
            cdsNFVendaItemNFVI_CEST
            ]);


      sdsUndProduto.Close;
      sdsUndProduto.Params[0].AsInteger := cdsNFVendaItemCODPRODUTO.AsInteger;
      sdsUndProduto.Open;


{$IFDEF APOLO}
      dmTributacaoUF.cdsTributacaoUF.Close;
      dmTributacaoUF.cdsTributacaoUF.Params[0].AsString := dmNFVenda.cdsNFVendaPES_UF.AsString;
      dmTributacaoUF.cdsTributacaoUF.Open;
      if dmTributacaoUF.cdsTributacaoUFTRB_UF.AsString <> '' then
        cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency := dmTributacaoUF.cdsTributacaoUFTRB_ALIQ.AsCurrency;
{$ENDIF}
    end;
{$ENDIF}

    ////////////////////////////////////////////////////////////////////
    dmAcesso.sqlVariant.Close;
    dmAcesso.sqlVariant.CommandText := 'SELECT coalesce(PRO_CST, ''000'') as PRO_CST FROM PRODUTO WHERE CODPRODUTO = ' + dmNFVenda.cdsNFVendaItemCODPRODUTO.AsString;
    dmAcesso.sqlVariant.Open;
    ////////////////////////////////////////////////////////////////////
    dmNFVenda.cdsNFVendaItemPRO_CST.AsString := dmAcesso.sqlVariant.FieldByName('PRO_CST').AsString;
    //
    dmNFVenda.cdsNFVendaItemNFVI_CST.AsString := '000';
    if ((dmConfiguracao.getStr('NFE.CST.PROD') = 'S') and (dmNFVenda.cdsNFVendaItemPRO_CST.AsString <> '')) then
      dmNFVenda.cdsNFVendaItemNFVI_CST.AsString :=
        '0' +
        copy(dmNFVenda.cdsNFVendaItemPRO_CST.AsString, 2, 2);
    ////////////////////////////////////////////////////////////////////

    //
    if cdsNFVendaItemCODPRODUTO.AsInteger > 0 then
    begin
      dmAcesso.sqlVariant.Close;
      dmAcesso.sqlVariant.CommandText :=
        ' Select CODCFOP, PRO_ALIQ_ICMS, PRO_ALIQ_ICMS_FORA, PRO_ALIQ_ICMS_NCONT,PRO_ALIQ_ICMS_FORA_NCONT, ' +
        '        PRO_PER_REDUC,PRO_PER_REDUC_FORA,PRO_PER_REDUC_NCONT,PRO_PER_REDUC_FORA_NCONT,CODPRODUTOUNIDADE ' +
        '   from PRODUTO where CODPRODUTO = ' + cdsNFVendaItemCODPRODUTO.AsString;
      dmAcesso.sqlVariant.Open;
      //
      cdsNFVendaItemCODPRODUTOUNIDADE_NFVI.AsInteger := dmAcesso.sqlVariant.FieldByName('CODPRODUTOUNIDADE').AsInteger;
      //
      if (trim(dmAcesso.sqlVariant.FieldByName('CODCFOP').AsString) <> '') then
        cdsNFVendaItemCODCFOP.AsString := dmAcesso.sqlVariant.FieldByName('CODCFOP').AsString;
      //
      if dmConfiguracao.getStr('PRO.FORA.DENT') = 'S' then
      begin
        //contribuiente
        if dmPessoa.PessoaContribuinte(cdsNFVendaCODPESSOA.AsInteger) then
        begin
          //dentro do estado
          if (cdsNFVendaPES_UF.AsString = dmAcesso.cdsParGeralPARG_UF.AsString) then
          begin
            cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_ALIQ_ICMS').AsCurrency;
            cdsNFVendaItemNFVI_PER_REDUC.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_PER_REDUC').AsCurrency
          end //fora do estado
          else begin
            cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_ALIQ_ICMS_FORA').AsCurrency;
            cdsNFVendaItemNFVI_PER_REDUC.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_PER_REDUC_FORA').AsCurrency
          end;
        end
        else //nao contribuiente
        begin
          //dentro do estado
          if (cdsNFVendaPES_UF.AsString = dmAcesso.cdsParGeralPARG_UF.AsString) then
          begin
            cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_ALIQ_ICMS_NCONT').AsCurrency;
            cdsNFVendaItemNFVI_PER_REDUC.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_PER_REDUC_NCONT').AsCurrency
          end //fora do estado
          else begin
            cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_ALIQ_ICMS_FORA_NCONT').AsCurrency;
            cdsNFVendaItemNFVI_PER_REDUC.AsCurrency := dmAcesso.sqlVariant.FieldByName('PRO_PER_REDUC_FORA_NCONT').AsCurrency
          end;
        end;
      end;
    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemCODPESSOA_FORNECEDORValidate(Sender: TField);
begin

{$IFNDEF PKGSSM}
  if Sender.AsString = '' then
    cdsNFVendaItemFORNECEDOR_NOME.Clear
  else
    if dmPesquisa.pesq_Pessoa_Forn.Localizar(Sender.AsString) then
      dmPesquisa.pesq_Pessoa_Forn.Complementar([cdsNFVendaItemFORNECEDOR_NOME]);
{$ENDIF}

end;

procedure TdmNFVenda.cdsNFVendaItemCODPRODUTOUNIDADE_NFVIValidate(
  Sender: TField);
begin
  inherited;
 //
  NFVendaItem_CalculaUnidade;
  cdsNFVendaItemNFVI_QTDE_UNDValidate(cdsNFVendaItemNFVI_QTDE_UND);
end;

procedure TdmNFVenda.cdsNFVendaItemCODPRODUTOValidate(Sender: TField);
var vCodLicitacaoItem: Integer;
begin
  if (dmNFVenda.cdsNFVendaItemCODPRODUTO.AsInteger > 0) then
  begin
    dmNFVenda.sdsUndProduto.Close;
    dmNFVenda.sdsUndProduto.Params[0].AsInteger := dmNFVenda.cdsNFVendaItemCODPRODUTO.AsInteger;
    dmNFVenda.sdsUndProduto.Open;

    if (dmConfiguracao.getStr('LIC.VER.NFV') = 'S') then
    begin
      dmAcesso.sqlVariant.Close;
      dmAcesso.sqlVariant.CommandText :=
        ' select '
        + ' LICITACAO_CONTRATO_ITEM.CODPRODUTO, LICCI_QTDE, LICCI_QTDE_FAT, LICCI_QTDE_LIMITE, LICCI_DATA_INICIO, '
        + ' LICCI_DATA_VALIDADE, LICCI_VLRUNIT, PRODUTO_UNIDADE.PROU_SIGLA, PRODUTO.PRO_DESCRICAO  '

      + '  from LICITACAO_CONTRATO_ITEM '

      + ' left join LICITACAO_CONTRATO on (LICITACAO_CONTRATO_ITEM.CODLICITACAOCONTRATO = LICITACAO_CONTRATO.CODLICITACAOCONTRATO) '
        + ' left join PRODUTO on (LICITACAO_CONTRATO_ITEM.CODPRODUTO = PRODUTO.CODPRODUTO) '
        + ' left join PRODUTO_UNIDADE on (LICITACAO_CONTRATO_ITEM.CODPRODUTOUNIDADE = PRODUTO_UNIDADE.CODPRODUTOUNIDADE) '

      + ' where  LICITACAO_CONTRATO_ITEM.CODPRODUTO = ' + Sender.AsString
        + ' and  LICITACAO_CONTRATO.CODPESSOA = ' + cdsNFVendaCODPESSOA.AsString
        + ' and  ((coalesce(LICCI_QTDE_LIMITE,0) - coalesce(LICCI_QTDE_FAT,0)) > 0)';
      dmAcesso.sqlVariant.Open;

      if dmAcesso.sqlVariant.IsEmpty then
        Exit;

      if (frmNFVendaItem <> nil) and (frmNFVendaItem.Showing) then
      begin
{$IFDEF MINOTAURO}
        vCodLicitacaoItem := frmLocalizarContratoLicitacaoItem.localizar(
          cdsNFVendaCODPESSOA.AsInteger,
          Sender.AsInteger);
        cdsNFVendaItemCODLICITACAOCONTRATOITEM.AsInteger := vCodLicitacaoItem;

        if (vCodLicitacaoItem <= 0) then ShowMessage('Nenhum Contrato de Licitação foi selecionado!');

{$ENDIF}
      end;
    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemCODSERVICOValidate(Sender: TField);
begin
  inherited;
  if Sender.AsInteger = 0 then
    cdsNFVendaItemSER_DESCRICAO.Clear
  else
  begin
    cdsNFVendaItemSERU_SIGLA.Origin := 'PROU_SIGLA';
    cdsNFVendaItemNFVI_VLR_UNITARIO.Origin := 'SER_VLRUNITARIO';
    cdsNFVendaItemCODPRODUTOUNIDADE_NFVI.Origin := 'CODUNIDADE';

{$IFNDEF PKGSSM}

    if dmServico.pesq_Servico.Localizar(Sender.AsString) then
      dmServico.pesq_Servico.Complementar([
//        cdsNFVendaItemNFVI_VLR_UND,
        cdsNFVendaItemNFVI_VLR_UNITARIO,
          cdsNFVendaItemSER_DESCRICAO,
          cdsNFVendaItemCODPRODUTOUNIDADE_NFVI,
          cdsNFVendaItemSERU_SIGLA
          ]);

    dmNFVenda.sdsUndServico.Close;
    dmNFVenda.sdsUndServico.Params[0].AsInteger := cdsNFVendaItemCODSERVICO.AsInteger;
    dmNFVenda.sdsUndServico.Open;

{$ENDIF}

    cdsNFVendaItemNFVI_VLR_UNITARIO.Origin := 'PRO_PRECO01';
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemNewRecord(DataSet: TDataSet);
begin
  cdsNFVendaItemCODNFVENDA.AsInteger := cdsNFVendaCODNFVENDA.AsInteger;
  cdsNFVendaItemCODSERIE.AsString := cdsNFVendaCODSERIE.AsString;
  cdsNFVendaItemNFVI_QTDE.AsCurrency := 1;
  cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency := 0;
  //
  cdsNFVendaItemNFVI_ALIQ_IPI.AsCurrency := 0;
  try
    if (dmConfiguracao.getInt('NFVI_ALIQ_IPI') > 0) then
      cdsNFVendaItemNFVI_ALIQ_IPI.AsCurrency := dmConfiguracao.getInt('NFVI_ALIQ_IPI');
  except
  end;
  //
  cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency := 0;
  cdsNFVendaItemNFVI_DI_COD_EXPORTADOR.AsString := '';
  cdsNFVendaItemNFVI_DI_LOCAL_DESEMB.AsString := '';
  cdsNFVendaItemNFVI_DI_NUMERO.AsString := '';
  cdsNFVendaItemNFVI_DI_UF_DESEMB.AsString := '';

  cdsNFVendaItemNFVI_II_VLR.AsCurrency := 0;
  cdsNFVendaItemNFVI_II_BC.AsCurrency := 0;
  cdsNFVendaItemNFVI_II_DESP_ADUANEIRAS.AsCurrency := 0;
  cdsNFVendaItemNFVI_IOF_VLR.AsCurrency := 0;

  cdsNFVendaItemNFVI_CATEGORIA.AsString := 'Produto';
  cdsNFVendaItemCODCFOP.AsString := cdsNFVendaCODCFOP.AsString;

  cdsNFVendaItemNFVI_MOD_BC.AsString := '3';
  //
  if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '2' then
    cdsNFVendaItemNFVI_CST_IPI.AsString := '99'
  else
    cdsNFVendaItemNFVI_CST_IPI.AsString := '01';
  //
  cdsNFVendaItemNFVI_ALTERAR_IPI.AsString := 'N';
  cdsNFVendaItemNFVI_TIPOPRECO.AsString := TIPO_ANTERIOR;
  if cdsNFVendaItemNFVI_TIPOPRECO.AsString = '' then
    cdsNFVendaItemNFVI_TIPOPRECO.AsString := '01';
  //
  cdsNFVendaItemNFVI_CSOSN.AsString := dmConfiguracao.getStr('NF.CSOSN');
  //
  cdsNFVendaItemNFVI_PIS_CST.AsString := dmConfiguracao.getStr('NFVI_PIS_CST');
  cdsNFVendaItemNFVI_COFINS_CST.AsString := dmConfiguracao.getStr('NFVI_COFINS_CST');
  cdsNFVendaItemNFVI_CST_IPI.AsString := dmConfiguracao.getStr('NFVI_CST_IPI');

end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_ALIQ_ICMSValidate(Sender: TField);
begin
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_ALIQ_IPIValidate(Sender: TField);
begin
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_CATEGORIAValidate(Sender: TField);
begin
  inherited;
  if (cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Produto') then
    dsUndComp.DataSet := sdsUndProduto
  else if (cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Serviço') then
    dsUndComp.DataSet := sdsUndServico;

end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_COFINS_BCValidate(Sender: TField);
begin
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_COFINS_PERValidate(Sender: TField);
begin
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_ICMS_BASEValidate(Sender: TField);
begin
  inherited;
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_PERDESCValidate(Sender: TField);
begin
  NFVENDA_CALC_DESC_PERC;
  cdsNFVendaItemNFVI_VLRDESC.OnValidate := nil;
  cdsNFVendaItemNFVI_VLRDESC.AsCurrency := 0;
  cdsNFVendaItemNFVI_VLRDESC.OnValidate := cdsNFVendaItemNFVI_VLRDESCValidate;
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_PER_REDUCValidate(Sender: TField);
begin
  cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency :=
    (cdsNFVendaItemNFVI_QTDE.AsCurrency * cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency);
  //
  if dmNFVenda.cdsNFVendaItemNFVI_PER_REDUC.AsCurrency > 0 then
  begin
    cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency :=
      cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency -
      (
      (cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency * dmNFVenda.cdsNFVendaItemNFVI_PER_REDUC.AsCurrency)
      / 100
      );
    NFVENDAITEM_CalcularTotal;
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_PIS_BCValidate(Sender: TField);
begin
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_PIS_PERValidate(Sender: TField);
begin
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_QTDE_UNDValidate(Sender: TField);
begin
  inherited;

  if (cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Produto') then
  begin

    try
      cdsNFVendaItemNFVI_QTDE.AsCurrency :=
        cdsNFVendaItemNFVI_QTDE_UND.AsCurrency *
        sdsUndProdutoQTDE.AsCurrency;
    except
      cdsNFVendaItemNFVI_QTDE.AsCurrency := cdsNFVendaItemNFVI_QTDE_UND.AsCurrency;
    end;

  end
  else if (cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Serviço') then
  begin

    cdsNFVendaItemNFVI_QTDE.AsCurrency := cdsNFVendaItemNFVI_QTDE_UND.AsCurrency;

  end;


end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_TIPOPRECOValidate(Sender: TField);
var
  sOld: string;
  sCampo: string;
begin
  sCampo := 'PRO_PRECO' + cdsNFVendaItemNFVI_TIPOPRECO.AsString;
  if cdsNFVendaItemNFVI_TIPOPRECO.AsString = '' then
    sCampo := 'PRO_PRECO' + '01';

  cdsNFVendaItemNFVI_VLR_UND.Origin := sCampo;
  //
  if cdsNFVendaItemCODPRODUTO.AsInteger <> 0 then
  begin
    try
      sOld := dmProduto.pesq_Produto_Venda.FieldKey;
      dmProduto.pesq_Produto_Venda.FieldKey := 'CODPRODUTO';
      if (dmProduto.pesq_Produto_Venda.Localizar(cdsNFVendaItemCODPRODUTO.AsString)) then
        dmProduto.pesq_Produto_Venda.Complementar([cdsNFVendaItemNFVI_VLR_UND]);
    finally
      dmProduto.pesq_Produto_Venda.FieldKey := sOld;
    end;
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_VLRDESCValidate(Sender: TField);
begin
  cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency := cdsNFVendaItemNFVI_VLRDESC.AsCurrency;
  cdsNFVendaItemNFVI_PERDESC.OnValidate := nil;
  cdsNFVendaItemNFVI_PERDESC.AsCurrency := 0;
  cdsNFVendaItemNFVI_PERDESC.OnValidate := cdsNFVendaItemNFVI_PERDESCValidate;
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_VLR_UNDValidate(Sender: TField);
begin
  try
    cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency :=
      cdsNFVendaItemNFVI_VLR_UND.AsCurrency / sdsUndProdutoQTDE.AsCurrency;
  except
    cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency :=
      cdsNFVendaItemNFVI_VLR_UND.AsCurrency;
  end;
end;

procedure TdmNFVenda.cdsNFVendaItemNFVI_VLR_UNITARIOValidate(Sender: TField);
begin
  cdsNFVendaItemNFVI_PER_REDUCValidate(cdsNFVendaItemNFVI_PER_REDUC);
  //
  cdsNFVendaItemNFVI_PIS_BC.AsCurrency := (cdsNFVendaItemNFVI_QTDE.AsCurrency * cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency);
  //
  cdsNFVendaItemNFVI_COFINS_BC.AsCurrency := (cdsNFVendaItemNFVI_QTDE.AsCurrency * cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency);
  //
  NFVENDAITEM_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaItemPRO_TIPOLISTAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.AsString = '0' then
    text := '0';
  if Sender.AsString = '1' then
    text := '+';
  if Sender.AsString = '2' then
    text := 'N';
  if Sender.AsString = '3' then
    text := '-';
end;

procedure TdmNFVenda.cdsNFVendaItemQtdeNovaEntregueValidate(Sender: TField);
begin
  if Sender.AsCurrency > (cdsNFVendaItemNFVI_QTDE.AsCurrency - cdsNFVendaItemNFVI_QTDE_ENTREGUE.AsCurrency) then
    dmAcesso.d2kReator.Funcoes.Win.Error('Quantidade maior que a disponivel!');
end;

procedure TdmNFVenda.cdsNFVendaNewRecord(DataSet: TDataSet);
begin
  TIPO_ANTERIOR := '01';
  dmParametro.cdsParNota.Open;
  try
    if (dmConfiguracao.getInt('NFV_CODFORMA') > 0) then
      cdsNFVendaCODFORMAPAGAMENTO.AsInteger := dmConfiguracao.getInt('NFV_CODFORMA');
  except
  end;
  //cdsNFVendaCODFORMAPAGAMENTO.AsInteger  := dmParametro.cdsParNotaPARN_CODFORMADEPAGAMENTO.AsInteger;
  //----------------------------------------------------------------------------
  cdsNFVendaNFV_TIPO.AsString := 'S';
  cdsNFVendaNFV_DTEMISSAO.AsDateTime := dmCaixaAbertura.getDataAbertura;
  cdsNFVendaNFV_STATUS.AsString := 'Aberta';
  cdsNFVendaNFV_SELO_FISCAL.AsString := dmParametro.cdsParNotaPARN_SELO_FISCAL.DisplayText;
  cdsNFVendaNFV_GER_FINANCEIRO.AsString := 'S';
  cdsNFVendaNFV_TP_FRETE.AsString := dmConfiguracao.getStr('NFV.TP.FRETE');
  cdsNFVendaNFV_ICMS_BASE.AsCurrency := 0;
  cdsNFVendaNFV_ICMS_ALIQ.AsCurrency := 0;
  cdsNFVendaNFV_ICMS.AsCurrency := 0;
  cdsNFVendaNFV_ISS_BASE.AsCurrency := 0;
  cdsNFVendaNFV_ISS.AsCurrency := 0;
  cdsNFVendaNFV_ISS_ALIQ.AsCurrency := 0;
  cdsNFVendaNFV_IPI.AsCurrency := 0;
  cdsNFVendaNFV_FRETE.AsCurrency := 0;
  cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency := 0;
  cdsNFVendaNFV_TOTAL_NOTA.AsCurrency := 0;
  cdsNFVendaNFV_PIS_PERC.AsCurrency := 0;
  cdsNFVendaNFV_COFINS_PERC.AsCurrency := 0;
  cdsNFVendaNFV_CS_PERC.AsCurrency := 0;
  cdsNFVendaNFV_ISS_PERC.AsCurrency := 0;
  cdsNFVendaNFV_IR_PERC.AsCurrency := 0;
  cdsNFVendaNFV_INSS_PERC.AsCurrency := 0;
  cdsNFVendaNFV_OUTROS_PERC.AsCurrency := 0;
  cdsNFVendaNFV_ICMS_SUBST_BASE.AsCurrency := 0;
  cdsNFVendaNFV_ICMS_SUBST.AsCurrency := 0;
  cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString := '1';

  // preencher CFOP PADRÃO
  if (dmConfiguracao.getStr('NF.CFOP.PAD') <> '') then
    cdsNFVendaCODCFOP.AsInteger := StrToInt(dmConfiguracao.getStr('NF.CFOP.PAD'));

  //----------------------------------------------------------------------------
  cdsNFVendaNFV_BAIXA_ESTOQUE.AsString := dmConfiguracao.getStr('NF.BAIXA.ESTQ');
  cdsNFVendaNFV_ENTREGUE.AsString := 'N';
  //
  cdsNFVendaNFV_OBS.AsString := dmConfiguracao.getStr('NF.AUT.OBS');
  cdsNFVendaCODPARGERAL.AsInteger := dmAcesso.cdsParGeralCODPARGERAL.AsInteger;
  //
  if dmParametro.cdsParNotaCODSERIEPADRAO.AsString <> '' then
    cdsNFVendaCODSERIE.AsString := dmParametro.cdsParNotaCODSERIEPADRAO.AsString;
  if dmParametro.cdsParNotaCODCFOPPADRAO.AsString <> '' then
    cdsNFVendaCODCFOP.AsString := dmParametro.cdsParNotaCODCFOPPADRAO.AsString;
end;

procedure TdmNFVenda.cdsNFVendaNFV_ACRESCIMOValidate(Sender: TField);
begin
  NFVENDA_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaNFV_DESCVLRValidate(Sender: TField);
begin
  dmNFVenda.NFVENDA_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaNFV_FRETEValidate(Sender: TField);
begin
  dmNFVenda.NFVENDA_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaNFV_IR_PERCValidate(Sender: TField);
begin
  dmNFVenda.NFVENDA_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaNFV_ISS_ALIQValidate(Sender: TField);
begin
  NFVENDA_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaNFV_TP_FRETEValidate(Sender: TField);
begin
  dmNFVenda.NFVENDA_CalcularTotal;
end;

procedure TdmNFVenda.cdsNFVendaServicoBeforePost(DataSet: TDataSet);
begin
  if cdsNFVendaServico.State in [dsInsert] then
  begin
    dmAcesso.sqlVariant.Close;
    dmAcesso.sqlVariant.CommandText := 'SELECT GEN_ID(GEN_NFVENDA_SERVICO, 1) FROM RDB$DATABASE';
    dmAcesso.sqlVariant.Open;
    cdsNFVendaServicoCODNFVENDASERVICO.AsInteger := dmAcesso.sqlVariant.Fields[0].AsInteger;
  end;
end;

procedure TdmNFVenda.cdsNFVendaServicoNewRecord(DataSet: TDataSet);
begin
  cdsNFVendaServico.FieldByName('CODNFVENDA').AsInteger :=
    cdsNFVenda.FieldByName('CODNFVENDA').AsInteger;
  cdsNFVendaServico.FieldByName('CODSERIE').AsString :=
    cdsNFVenda.FieldByName('CODSERIE').AsString;
  cdsNFVendaServicoNFVS_QTDE.AsCurrency := 1;
  cdsNFVendaServicoNFVS_VLR_UNITARIO.AsCurrency := 0;
  cdsNFVendaServicoNFVS_TOTAL.AsCurrency := 0;
  cdsNFVendaServicoNFVS_UNIDADE.AsString := 'UND';
end;

procedure TdmNFVenda.cdsNFVendaServicoNFVS_QTDEValidate(Sender: TField);
begin
  CalcularTotalNFVENDASERVICO;
end;

procedure TdmNFVenda.cdsNFVendaServicoNFVS_VLR_UNITARIOValidate(Sender: TField);
begin
  CalcularTotalNFVENDASERVICO;
end;

procedure TdmNFVenda.DataModuleCreate(Sender: TObject);
begin
  inherited;

{$IFDEF PKGSSM}
{$ELSE}
  dmPesquisa.pesq_NFDevolucao.DataSet := dmNFVenda.cdsNFVenda;
{$ENDIF}

  TIPO_ANTERIOR := '01';
  sdsUndServico.Connection := dmAcesso.sqlCon;
  sdsContasParcela.Connection := dmAcesso.sqlCon;

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.PRO.SERV',
    CONF_TXT,
    'N',
    'PERMITIR PREENCHER NF COM PRODUTO E SERVICO');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.NFE.LAY20',
    CONF_TXT,
    'N',
    'UTILIZAR LAYOUT 2.0');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.CARNE',
    CONF_TXT,
    'N',
    'EXIBIR BOTÃO PARA IMPRESSÃO DO CARNE DE PAGAMENTO');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.IMPORT',
    CONF_TXT,
    'N',
    'PERMITIR PREENCHER DADOS DE IMPORTACAO NO ITEM DA NFVENDA');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.EXI.SELO',
    CONF_TXT,
    'N',
    'EXIBIR SELO FISCAL NA TELA DE NFVENDA');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.CAN.PEDVEND',
    CONF_TXT,
    'S',
    'REABRIR O PEDIDO QUANDO CANCELAR A NOTA');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFE.NOM.FANT',
    CONF_TXT,
    'N',
    'NF-E EXPORTAR NOME FANTASIA');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFE.OPT.SMP',
    CONF_TXT,
    '0',
    'NF-E TIPO DO OPTANTE SIMPLES');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFE.CNAE',
    CONF_TXT,
    '0',
    'NF-E CNAE');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFE.OPT.ALIQ',
    CONF_FLO,
    '0',
    'NF-E ALIQUOTA DO SIMPLES');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.BAIXA.ESTQ',
    CONF_FLO,
    'S',
    'BAIXAR ESTOQUE NA NOTA FISCAL');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.FAT.S/EST',
    CONF_FLO,
    'S',
    'PERMITIR FATURAR HAVENDO PRODUTOS SEM SALDO EM ESTOQUE');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFE.CST.PROD',
    CONF_FLO,
    'S',
    'UTILIZAR NA NF-E O CST DO CADASTRO DO PRODUTO');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.INF.VEND',
    CONF_TXT,
    'N',
    'PERMITIR INFORMAR VENDEDOR NA NF VENDA');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.ORD.DESCRI',
    CONF_TXT,
    'N',
    'ORDENAR ITENS DA NF-E PELA DESCRICAO DO PRODUTO');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFV.TP.FRETE',
    CONF_TXT,
    'FOB',
    'FRETE PADRÃO DA NF DE VENDA (CIF/FOB)');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.CFOP.PAD',
    CONF_TXT,
    '',
    'CFOP PADRÃO DA NF DE VENDA');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.DET.COMP',
    CONF_TXT,
    'N',
    'DETALHAR NO DANFE OS PRODUTOS COMPOSTOS');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.TP.VND',
    CONF_TXT,
    'N',
    'TRABALHAR COM TIPO DE PRECO NA NFE');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.EXT.ATV',
    CONF_TXT,
    'S',
    'ATIVAR CONTATO EXTERIOR NA NFE');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.LEI.IMP',
    CONF_TXT,
    'S',
    'INFORMAR O IMPOSTO DA NOTA');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.AUT.OBS',
    CONF_TXT,
    '',
    'OBSERVACAO EM TODAS AS NOTAS');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.IRIS.FAT',
    CONF_TXT,
    'S',
    'IRIS - FATURAR AUTOMATICAMENTE A NF-E');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NFE.2VIA.SENHA',
    CONF_INT,
    '',
    'SENHA PARA IMPRIMIR 2VIA DA NF-e');

{  dmConfiguracao.verificaConfiguracao(
    'NF VENDA',
   //XXXXXXXXXXXXXX
    'NF.IMP.S/EST',
    CONF_FLO,
    'S',
    'PERMITIR IMPRIMIR/TRANSMITIR HAVENDO PRODUTOS SEM SALDO EM ESTOQUE');
 }

  sdsUndProduto.Connection := dmAcesso.sqlCon;
  dsUndComp.DataSet := sdsUndProduto;


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NF.CSOSN',
    CONF_TXT,
    '101',
    'CSOSN - PADRAO');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFVI_PIS_CST',
    CONF_TXT,
    '',
    'PIS CST - 01,02,03 E ETCS');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFVI_COFINS_CST',
    CONF_TXT,
    '',
    'COFINS CST - 01,02,03 E ETCS');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFVI_CST_IPI',
    CONF_TXT,
    '',
    'IPI CST - 01,02,03 E ETCS');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFVI_ALIQ_IPI',
    CONF_FLO,
    '0',
    'ALIQ IPI');


  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFV_CODFORMA',
    CONF_INT,
    '0',
    'CÓDIGO DA FORMA DE PAGAMENTO');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFE4.PAG.TOTAL',
    CONF_INT,
    'N',
    'ENVIAR PAGAMENTO SEMPRE COM O TOTAL DA NOTA');

  dmConfiguracao.verificaConfiguracao(
    'NF VENDA - VALOR PADRÃO',
   //XXXXXXXXXXXXXX
    'NFE4.COB.TOTAL',
    CONF_INT,
    'N',
    'ENVIAR COBRANCA SEMPRE COM O TOTAL DA NOTA');



{$IFDEF APOLO}
    // mudar mascara do valor unitario
  cdsNFVendaItemNFVI_VLR_UNITARIO.DisplayFormat := ',0.000';
{$ENDIF}

{$IFDEF IRIS}
  cdsNFVendaItemPRODG_DESCRICAO.Visible := True;
{$ENDIF}
end;

procedure TdmNFVenda.gerarInstance;
begin
  if (dmNFVenda = nil) then
    Application.CreateForm(TdmNFVenda, dmNFVenda);
end;

function TdmNFVenda.GetChaveAcesso: string;
var
  chave: string;
  codserie: Integer;
begin
  if dmConfiguracao.getStr('MULTI.EMPRESA') = 'S' then
  begin
    dmSerie.cdsSerie.Close;
    dmSerie.cdsSerie.Params[0].AsString := dmNFVenda.cdsNFVendaCODSERIE.AsString;
    dmSerie.cdsSerie.Open;
    //
    if trim(dmSerie.cdsSerieCODSERIE_NFE.AsString) <> '' then
      codserie := dmSerie.cdsSerieCODSERIE_NFE.AsInteger
    else
      codserie := dmNFVenda.cdsNFVendaCODSERIE.AsInteger;
  end
  else
    codserie := dmNFVenda.cdsNFVendaCODSERIE.AsInteger;

  //
  chave := GerarChaveAcesso(
    UFparaCodigo(dmAcesso.cdsParGeralPARG_UF.AsString),
    dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime,
    OnlyNumber(dmAcesso.cdsParGeralPARG_CPFCGC.AsString),
    codserie,
    dmNFVenda.cdsNFVendaCODNFVENDA.AsInteger,
    StrToInt(TpEmisToStr(dmNFe.ACBrNFe1.Configuracoes.Geral.FormaEmissao)),
    dmNFVenda.cdsNFVendaCODNFVENDA.AsInteger,
    55
    );
  //
  Result := AnsiReplaceStr(Chave, 'NFe', '');
end;

procedure TdmNFVenda.NFE_Cofigure(CODNFVENDA: Integer; CODSERIE: string; CODPESSOA: Integer);
begin
  dmNFe.configurarNFE;
  //
  //
  dmNFVenda.cdsNFVenda.Close;
  dmNFVenda.cdsNFVenda.Params.ParamByName('CODNFVENDA').AsInteger := CODNFVENDA;
  dmNFVenda.cdsNFVenda.Params.ParamByName('CODSERIE').AsString := CODSERIE;
  dmNFVenda.cdsNFVenda.Open;
  //
  //
  dmPessoa.cdsPessoa.Close;
  dmPessoa.cdsPessoa.Params.ParamByName('CODPESSOA').AsInteger := CODPESSOA;
  dmPessoa.cdsPessoa.Open;
  //
  //
  dmFormaDePagamento.cdsFormaDePagamento.Close;
  dmFormaDePagamento.cdsFormaDePagamento.Params.ParamByName('CODFORMAPAGAMENTO').AsInteger :=
    dmNFVenda.cdsNFVendaCODFORMAPAGAMENTO.AsInteger;
  dmFormaDePagamento.cdsFormaDePagamento.Open;
  //
  //
  dmNFe.ACBrNFe1.NotasFiscais.Clear;
end;

procedure TdmNFVenda.NFE_GerarDados(AObsAdd: Integer; vlr, percent: string);
var
  i: Integer;
  aliq, totalAliq: Currency;
  obs: string;
  vdescitens: Currency;
  perItem: Currency;
  freteRateio, outroRateio: Currency;
  freteTemp: Currency;
  CstItem: string;
  chave: string;
  vTotalPIS, vTotalCOFINS: Currency;
  descontotalRateio, descontoTemp: Currency;
  totalItensCompostos: Integer;
  itemDetalhado: Boolean;
  totalcomp, totalitemtemp: Currency;
  itemcomposto: Integer;
  pCurTemp: Currency;
  ValorTribItemAproximado, ValorTotalTribAproximado, AAliqTrib: Currency;
  vTotalICMSSTFCP, vTotalICMSFCP, vTotalICMSUFFCP: Currency;
  nenhumPagamento: Boolean;
  totalVICMSUFDest: Currency;
begin
  totalVICMSUFDest := 0;
  ValorTribItemAproximado := 0;
  ValorTotalTribAproximado := 0;
  //
  vTotalICMSSTFCP := 0;
  vTotalICMSFCP := 0;
  vTotalICMSUFFCP := 0;
  //
  with dmNFe.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    infNFe.ID := dmNFVenda.cdsNFVendaCODNFVENDA.AsString;
    // Código da UF do emitente do Documento Fiscal. Utilizar a Tabela do
    // IBGE de código de unidades da federação (Anexo VII - Tabela de UF,
    // Município e País).
    Ide.cUF := UFparaCodigo(dmAcesso.cdsParGeralPARG_UF.AsString);
    // Código numérico que compõe a Chave de Acesso. Número aleatório
    // gerado pelo emitente para cada NF-e para evitar acessos
    // indevidos da NF-e.
    Ide.cNF := StrToInt(infNFe.ID);
    // Informar a natureza da operação de
    // que decorrer a saída ou a entrada,
    // tais como: venda, compra, transferência, devolução,
    // importação, consignação, remessa (para fins de demonstração, de
    // industrialização ou outra), conforme previsto na alínea 'i', inciso I,
    // art. 19 do CONVÊNIO S/Nº, de 15 de dezembro de 1970.
    Ide.natOp := dmNFVenda.cdsNFVendaCFOP_DESCRICAO.AsString;
    //0 – pagamento à vista;
    //1 – pagamento à prazo;
    //2 - outros.
    if (dmFormaDePagamento.cdsFormaDePagamentoFPG_PARCELAS.AsInteger = 1) and
      (dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS.AsInteger = 0) then
      Ide.indPag := ipVista
    else
      Ide.indPag := ipPrazo;
    //Utilizar o código 55 para
    //identificação da NF-e, emitida em
    //substituição ao modelo 1 ou 1A.
    Ide.modelo := 55;
    //Série do Documento Fiscal,
    //informar 0 (zero) para série única.

    if dmConfiguracao.getStr('MULTI.EMPRESA') = 'S' then
    begin
      dmSerie.cdsSerie.Close;
      dmSerie.cdsSerie.Params[0].AsString := dmNFVenda.cdsNFVendaCODSERIE.AsString;
      dmSerie.cdsSerie.Open;
      //
      if trim(dmSerie.cdsSerieCODSERIE_NFE.AsString) <> '' then
        Ide.serie := dmSerie.cdsSerieCODSERIE_NFE.AsInteger
      else
        Ide.serie := dmNFVenda.cdsNFVendaCODSERIE.AsInteger;
    end
    else
      Ide.serie := dmNFVenda.cdsNFVendaCODSERIE.AsInteger;
    //Número do Documento Fiscal.
    Ide.nNF := StrToInt(infNFe.ID);
    Ide.dEmi := dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime;
    Ide.dSaiEnt := dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime;
    //0-entrada / 1-saída
    if dmNFVenda.cdsNFVendaNFV_TIPO.AsString = 'E' then
      Ide.tpNF := tnEntrada
    else
      Ide.tpNF := tnSaida;
    //Informar o município de ocorrência
    //do fato gerador do ICMS. Utilizar a
    //Tabela do IBGE (Anexo VII -
    //Tabela de UF, Município e País)
    Ide.cMunFG := dmAcesso.cdsParGeralPARG_CODCIDADE.AsInteger;
    //GerarIdeNFref
    //1-Retrato/ 2-Paisagem
    if dmNFe.ACBrNFe1.DANFE <> nil then
      Ide.tpImp := dmNFe.ACBrNFe1.DANFE.TipoDANFE
    else
      Ide.tpImp := tiRetrato;

//    Ide.NFref.Add.refNFe := ;

    //1-Normal/ 2-Contingência
    Ide.tpEmis := dmNFe.ACBrNFe1.Configuracoes.Geral.FormaEmissao;

    if (Ide.tpEmis = teSCAN) then
    begin
      Ide.xJust := 'Serviço está fora';
      Ide.dhCont := dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime;
    end;

    infRespTec.idCSRT := 0;
    infRespTec.CNPJ := '09216895000170';
    infRespTec.xContato := 'IZAIAS AVILA DA CONCEICAO FILHO';
    infRespTec.email := 'izaias@softwaresobmedida.com';
    infRespTec.fone := '81999792585';

    //Ide.cDV, DSC_CDV);
    //1-Produção/ 2-Homologação
    Ide.tpAmb := dmNFe.ACBrNFe1.Configuracoes.WebServices.Ambiente;
    //1- NF-e normal/ 2-NF-e
    //complementar / 3 – NF-e de ajuste
    if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '2' then
    begin
      Ide.finNFe := fnComplementar;
      if dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsInteger = 0 then
        dmAcesso.d2kReator.Funcoes.Win.Error('Você precisa escolher uma nota de referencia!');
      //
      with Ide.NFref.Add do
      begin
        dmAcesso.sqlVariant.Close;
        dmAcesso.sqlVariant.CommandText :=
          'select NFV_DTEMISSAO from nfvenda where codnfvenda = ' + dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsString
          + ' and codserie = ' + dmNFVenda.cdsNFVendaCODSERIE_DEV.AsString;
        dmAcesso.sqlVariant.Open;

        //
        chave := GerarChaveAcesso(
          UFparaCodigo(dmAcesso.cdsParGeralPARG_UF.AsString),
          dmAcesso.sqlVariant.FieldByName('NFV_DTEMISSAO').AsDateTime,
          OnlyNumber(dmAcesso.cdsParGeralPARG_CPFCGC.AsString),
          dmNFVenda.cdsNFVendaCODSERIE_DEV.AsInteger,
          dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsInteger,
          StrToInt(TpEmisToStr(dmNFe.ACBrNFe1.Configuracoes.Geral.FormaEmissao)),
          dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsInteger,
          55
          );
       //
        chave := AnsiReplaceStr(Chave, 'NFe', '');
        refNFe := chave;
      end;
    end
    else
      Ide.finNFe := fnNormal;
    //
    if dmNFVenda.cdsNFVendaNFV_REFNFE.AsString <> '' then
      Ide.NFref.Add.refNFe := dmNFVenda.cdsNFVendaNFV_REFNFE.AsString;
    //
    if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '1' then
      Ide.finNFe := fnNormal;
    if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '2' then
      Ide.finNFe := fnComplementar;
    if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '3' then
      Ide.finNFe := fnAjuste;
    if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '4' then
      Ide.finNFe := fnDevolucao;
    //
    if dmNFVenda.cdsNFVendaCODPEDECF.AsInteger > 0 then
    begin
      dmAcesso.sqlVariant_3.Close;
      dmAcesso.sqlVariant_3.CommandText :=
        ' SELECT ' +
        '   PEDECF.PECF_NUMECF, ' +
        '   PEDECF.PECF_COO ' +
        ' FROM ' +
        '   PEDECF ' +
        ' WHERE ' +
        '   PEDECF.CODPEDECF = ' + dmNFVenda.cdsNFVendaCODPEDECF.AsString;
      dmAcesso.sqlVariant_3.Open;
      //
      with Ide.NFref.Add.RefECF do
      begin
        modelo := ECFModRef2D;
        nECF := dmAcesso.sqlVariant_3.FieldByName('PECF_NUMECF').AsString;
        nCOO := dmAcesso.sqlVariant_3.FieldByName('PECF_COO').AsString;
      end;
      dmAcesso.sqlVariant_3.Close;
    end;
    //
    if dmNfVenda.cdsNFVendaPES_CONSUMIDOR_FINAL.AsString = 'S' then
      Ide.indFinal := cfConsumidorFinal
    else if dmNfVenda.cdsNFVendaPES_CONSUMIDOR_FINAL.AsString = 'N' then
      Ide.indFinal := cfNao
    else
    begin
      if dmPessoa.cdsPessoaPES_TIPO_PESSOA.AsString = 'F' then
        Ide.indFinal := cfConsumidorFinal
      else
        Ide.indFinal := cfNao;
    end;



    //Identificador do processo de
    //emissão da NF-e:
    //0 - emissão de NF-e com aplicativo
    //do contribuinte;
    //1 - emissão de NF-e avulsa pelo
    //Fisco;
    //2 - emissão de NF-e avulsa, pelo
    //contribuinte com seu certificado
    //digital, através do site do Fisco;
    //3- emissão NF-e pelo contribuinte
    //com aplicativo fornecido pelo Fisco.
    Ide.procEmi := peAplicativoContribuinte;
    //Identificador da versão do processo
    //de emissão (informar a versão do aplicativo emissor de NF-e).
    Ide.verProc := '1.0.0.0';
    //
    //
    //pcnNFeW
    //
    //
    Emit.CNPJCPF := OnlyNumber(dmAcesso.cdsParGeralPARG_CPFCGC.AsString);
    Emit.CNAE := dmConfiguracao.getStr('NFE.CNAE');
    Emit.IE := OnlyNumber(dmAcesso.cdsParGeralPARG_IE.AsString);

    Emit.xNome := dmAcesso.cdsParGeralPARG_RAZAOSOCIAL.AsString;
    Emit.xFant := dmAcesso.cdsParGeralPARG_EMPRESA.AsString;
    dmNFe.ACBrNFe1.DANFE.Site := dmAcesso.cdsParGeralPARG_SITE.AsString;
    Emit.EnderEmit.fone := dmAcesso.cdsParGeralPARG_TELEFONE.AsString; ; //copy(OnlyNumber(dmAcesso.cdsParGeralPARG_TELEFONE.AsString), 1, 10);
    Emit.EnderEmit.CEP := StrToInt(OnlyNumber(dmAcesso.cdsParGeralPARG_CEP.AsString));
    Emit.EnderEmit.xLgr := dmAcesso.cdsParGeralPARG_ENDERECO.AsString;
    Emit.EnderEmit.nro := OnlyNumber(dmAcesso.cdsParGeralPARG_NUMERO.AsString);
    Emit.EnderEmit.xCpl := dmAcesso.cdsParGeralPARG_COMPLEMENTO.AsString;
    Emit.EnderEmit.xBairro := dmAcesso.cdsParGeralPARG_BAIRRO.ASString;
    Emit.EnderEmit.cMun := dmAcesso.cdsParGeralPARG_CODCIDADE.AsInteger;
    Emit.EnderEmit.xMun := dmAcesso.cdsParGeralPARG_CIDADE.AsString;
    Emit.EnderEmit.UF := dmAcesso.cdsParGeralPARG_UF.AsString;
    Emit.EnderEmit.xPais := 'BRASIL';
    Emit.EnderEmit.cPais := 1058;

    if not ((cdsNFVendaCFOP_CLASSIFICACAO.AsString = 'Devolução')
      and
      ((cdsNFVendaCODCFOP.AsString = '5411') or
      (cdsNFVendaCODCFOP.AsString = '6411') or
      (cdsNFVendaCODCFOP.AsString = '5201') or
      (cdsNFVendaCODCFOP.AsString = '5202') or
      (cdsNFVendaCODCFOP.AsString = '6202') or
      (cdsNFVendaCODCFOP.AsString = '6201'))) and (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional')
      then
      Emit.CRT := crtSimplesNacional;

    ////////////////////////////////////////////////////////////////////////////
    // pegar o nome do destinatario
    if dmConfiguracao.getStr('NFE.NOM.FANT') = 'S' then
      Dest.xNome := dmPessoa.cdsPessoaPES_NOME.ASString
    else
    begin
      if dmPessoa.cdsPessoaPES_RAZAO_SOCIAL.AsString <> '' then
        Dest.xNome := dmPessoa.cdsPessoaPES_RAZAO_SOCIAL.AsString
      else
        Dest.xNome := dmPessoa.cdsPessoaPES_NOME.ASString;
    end;
    // pegar o pais
    Dest.EnderDest.xPais := dmPessoa.cdsPessoaPES_PAIS.AsString;
    if Dest.EnderDest.xPais = '' then
    begin
      Dest.EnderDest.xPais := 'BRASIL';
      Dest.EnderDest.cPais := 1058;
    end
    else
      Dest.EnderDest.cPais := dmNFe.obterBacen(Dest.EnderDest.xPais);


    Ide.idDest := doInterna;
    if dmAcesso.cdsParGeralPARG_UF.AsString <> dmPessoa.cdsPessoaPES_UF.AsString then
      Ide.idDest := doInterestadual;
    if Dest.EnderDest.xPais <> 'BRASIL' then
      Ide.idDest := doExterior;

    // (pcNao, pcPresencial, pcInternet, pcTeleatendimento, pcEntregaDomicilio, pcOutros)
    Ide.indPres := pcNao;

    // endereço
    Dest.EnderDest.xLgr := dmPessoa.cdsPessoaPES_ENDERECO.AsString;
    Dest.EnderDest.nro := OnlyNumber(dmPessoa.cdsPessoaPES_ENDERECO_NUMERO.ASString);
    Dest.EnderDest.xCpl := dmPessoa.cdsPessoaPES_ENDERECO_COMPLEMENTO.AsString;
    Dest.EnderDest.xBairro := dmPessoa.cdsPessoaPES_BAIRRO.AsString;

    {if (cdsNFVendaPES_EMAIL.AsString <> '') then
      Dest.Email := cdsNFVendaPES_EMAIL.AsString;

    if (cdsNFVendaPES_EMAIL_NFE.AsString = '') then
      Dest.Email :=cdsNFVendaPES_EMAIL_NFE.AsString;
    }

    // cep
    try
      Dest.EnderDest.CEP := StrToInt(OnlyNumber(dmPessoa.cdsPessoaPES_CEP.ASString));
    except
      Dest.EnderDest.CEP := 0;
    end;

    // se for diferente de brasil
    if (dmConfiguracao.getStr('NF.EXT.ATV') = 'S') and
      (Dest.EnderDest.xPais <> 'BRASIL')
      then
    begin
      Dest.CNPJCPF := '';
      // Municipio
      Dest.EnderDest.cMun := 9999999;
      Dest.EnderDest.xMun := 'EXTERIOR';
      //
      Dest.EnderDest.UF := 'EX';
      Dest.EnderDest.Fone := copy(OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE_DDD.ASString) + OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE.ASString), 1, 10);
      Dest.IE := '';
      //
      Exporta.UFembarq := dmNFVenda.cdsNFVendaNFV_UF_EMB.AsString;
      Exporta.xLocEmbarq := dmNFVenda.cdsNFVendaNFV_LOCAL_EMB.AsString;
    end
    else
    begin
      Dest.CNPJCPF := OnlyNumber(dmPessoa.cdsPessoaPES_CPFCNPJ.AsString);
      // Municipio
      try
        Dest.EnderDest.cMun :=
          StrToInt(
          dmNFe.obterCodigoMunicipio(
          dmPessoa.cdsPessoaPES_UF.AsString,
          dmPessoa.cdsPessoaPES_CIDADE.AsString
          )
          );
      except
        on E: Exception do
        begin
          dmAcesso.d2kReator.Funcoes.Win.Error('Erro no Municipio - UF: ' + dmPessoa.cdsPessoaPES_UF.AsString + ' -- Cidade: ' + dmPessoa.cdsPessoaPES_CIDADE.AsString + #13 + 'Verifique Arquivo: ' + 'MunIBGE\MunIBGE-UF' + InttoStr(UFparaCodigo(dmPessoa.cdsPessoaPES_UF.AsString)) + '.txt');
          Exit;
        end;
      end;
      Dest.EnderDest.xMun := dmPessoa.cdsPessoaPES_CIDADE.AsString;
      //
      Dest.EnderDest.UF := dmPessoa.cdsPessoaPES_UF.AsString;
      Dest.EnderDest.Fone := copy(OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE_DDD.ASString) + OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE.ASString), 1, 10);
      //
      if (dmPessoa.cdsPessoaPES_IE.ASString = 'ISENTO') or
        (dmPessoa.cdsPessoaPES_IE.ASString = '') then
      begin
        //if dmPessoa.cdsPessoaPES_TIPO_PESSOA.AsString = 'F' then
        Dest.indIEDest := inNaoContribuinte;
          //ide.indFinal := cfConsumidorFinal;
        //else
        //  Dest.indIEDest := inIsento;
      end
      else
      begin
        Dest.indIEDest := inContribuinte;
        Dest.IE := dmPessoa.cdsPessoaPES_IE.ASString;
      end;
    end;
    ////////////////////////////////////////////////////////////////////////////
    dmNFVenda.cdsPesq_Contas.Close;
    dmNFVenda.cdsPesq_Contas.Params.ParamByName('CODNFVENDA').AsInteger := dmNFVenda.cdsNFVendaCODNFVENDA.AsInteger;
    dmNFVenda.cdsPesq_Contas.Params.ParamByName('CODSERIE').AsString := dmNFVenda.cdsNFVendaCODSERIE.AsString;
    dmNFVenda.cdsPesq_Contas.Open;
    ////////////////////////////////////////////////////////////////////////////
    i := 0;
    // cobrança
    Cobr.Fat.vDesc := 0;
    Cobr.Fat.vOrig := 0;
    Cobr.Fat.vLiq := 0;
    // duplicatas
    while not (dmNFVenda.cdsPesq_Contas.Eof) do
    begin
      if dmNFVenda.cdsPesq_ContasCON_VLRPARCELA.AsCurrency > 0 then
      begin
        // cobrança
        Cobr.Fat.nFat := dmNFVenda.cdsPesq_ContasCON_NUMDOC.AsString;
        Cobr.Fat.vOrig := Cobr.Fat.vOrig + dmNFVenda.cdsPesq_ContasCON_VLRPARCELA.AsCurrency;
        Cobr.Fat.vLiq := Cobr.Fat.vLiq + dmNFVenda.cdsPesq_ContasCON_VLRPARCELA.AsCurrency;
        // duplicatas
        Cobr.Dup.Add;
        Cobr.Dup.Items[i].nDup := FormatCurr('000', i + 1); // dmNFVenda.cdsPesq_ContasCON_NUMDOC.AsString;
        Cobr.Dup.Items[i].dVenc := dmNFVenda.cdsPesq_ContasCON_DTVENC.AsDateTime;
        Cobr.Dup.Items[i].vDup := dmNFVenda.cdsPesq_ContasCON_VLRPARCELA.AsCurrency;
      end;
      // proximo
      inc(i);
      dmNFVenda.cdsPesq_Contas.Next;
    end;

    //
    dmNFVenda.sdsContasParcela.Close;
    dmNFVenda.sdsContasParcela.Params.ParamByName('CODNFVENDA').AsInteger := dmNFVenda.cdsNFVendaCODNFVENDA.AsInteger;
    dmNFVenda.sdsContasParcela.Params.ParamByName('CODSERIE').AsString := dmNFVenda.cdsNFVendaCODSERIE.AsString;
    dmNFVenda.sdsContasParcela.DataSet.Params.ParamByName('CODNFVENDA').AsInteger := dmNFVenda.cdsNFVendaCODNFVENDA.AsInteger;
    dmNFVenda.sdsContasParcela.DataSet.Params.ParamByName('CODSERIE').AsString := dmNFVenda.cdsNFVendaCODSERIE.AsString;
    dmNFVenda.sdsContasParcela.Open;

    if dmConfiguracao.getStr('NFE4.COB.TOTAL') = 'S' then
    begin

        // cobrança
      Cobr.Fat.nFat := dmNFVenda.cdsNFVendaCODNFVENDA.AsString;
      Cobr.Fat.vOrig := cdsNFVendaNFV_TOTAL_NOTA.AsCurrency;
      Cobr.Fat.vLiq := cdsNFVendaNFV_TOTAL_NOTA.AsCurrency;
        // duplicatas
      Cobr.Dup.Add;
      Cobr.Dup.Items[i].nDup := '001';
      Cobr.Dup.Items[i].dVenc := now + 30;
      Cobr.Dup.Items[i].vDup := cdsNFVendaNFV_TOTAL_NOTA.AsCurrency;

    end;

    // pagamento com o total da nota
    if dmConfiguracao.getStr('NFE4.PAG.TOTAL') = 'S' then
    begin
      pag.Add;
      pag.Items[0].indPag := ipPrazo;
      pag.Items[0].tPag := fpBoletoBancario;
      pag.Items[0].vPag := cdsNFVendaNFV_TOTAL_NOTA.AsCurrency;
    end
    else // nf de devolução
      if dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '4' then
      begin
        pag.Add;
        pag.Items[0].tPag := fpSemPagamento;
        pag.Items[0].vPag := 0;
      end
      else
      begin
        nenhumPagamento := true;
        i := 0;
        while not (dmNFVenda.sdsContasParcela.Eof) do
        begin
          nenhumPagamento := true;
          pag.Add;
          if (dmFormaDePagamento.cdsFormaDePagamentoFPG_PARCELAS.AsInteger = 1) and
            (dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS.AsInteger = 0) then
            pag.Items[i].indPag := ipVista
          else
            pag.Items[i].indPag := ipPrazo;
        //
          if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '01' then
            pag.Items[i].tPag := fpDinheiro
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '02' then
            pag.Items[i].tPag := fpCheque
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '03' then
            pag.Items[i].tPag := fpCartaoCredito
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '04' then
            pag.Items[i].tPag := fpCartaoDebito
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '05' then
            pag.Items[i].tPag := fpCreditoLoja
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '10' then
            pag.Items[i].tPag := fpValeAlimentacao
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '11' then
            pag.Items[i].tPag := fpValeRefeicao
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '12' then
            pag.Items[i].tPag := fpValePresente
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '13' then
            pag.Items[i].tPag := fpValeCombustivel
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '15' then
            pag.Items[i].tPag := fpBoletoBancario
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '90' then
            pag.Items[i].tPag := fpSemPagamento
          else if dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '99' then
            pag.Items[i].tPag := fpOutro;
          pag.Items[i].vPag := dmNFVenda.sdsContasParcelaCON_VLRPARCELA.AsCurrency;
        //
          if (dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '03') or
            (dmNFVenda.sdsContasParcelaMOE_NFE_PAG.AsString = '04')
            then
          begin
            if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '01' then
              pag.Items[i].tBand := bcVisa
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '02' then
              pag.Items[i].tBand := bcMastercard
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '03' then
              pag.Items[i].tBand := bcAmericanExpress
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '04' then
              pag.Items[i].tBand := bcSorocred
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '05' then
              pag.Items[i].tBand := bcDinersClub
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '06' then
              pag.Items[i].tBand := bcElo
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '07' then
              pag.Items[i].tBand := bcHipercard
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '08' then
              pag.Items[i].tBand := bcAura
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '09' then
              pag.Items[i].tBand := bcCabal
            else if dmNFVenda.sdsContasParcelaMOE_NFE_BAND.AsString = '99' then
              pag.Items[i].tBand := bcOutros;
            pag.Items[i].tpIntegra := tiPagNaoIntegrado;
          end;
        //
          inc(i);
          dmNFVenda.sdsContasParcela.Next;
        end;

        if nenhumPagamento then
        begin
          pag.Add;
          pag.Items[0].tPag := fpSemPagamento;
          pag.Items[0].vPag := 0;
        end;
      end;

    //--------------------------------------------------------------------------
    vdescitens := 0;
    i := 0;
    freteRateio := 0;
    outroRateio := 0;

    vTotalPIS := 0;
    vTotalCOFINS := 0;
    descontotalRateio := 0;

    if (dmConfiguracao.getStr('NF.ORD.DESCRI') = 'S') then
      dmNFVenda.cdsNFVendaItem.IndexFieldNames := 'PRO_DESCRICAO';
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    dmNFVenda.cdsNFVendaItem.First;
    while not (dmNFVenda.cdsNFVendaItem.Eof) do
    begin
      ValorTribItemAproximado := 0;
      totalItensCompostos := 0;
      itemDetalhado := false;
      //
      if (dmConfiguracao.getStr('NF.DET.COMP') = 'S') then
      begin
        dmAcesso.sqlVariant_2.Close;
        dmAcesso.sqlVariant_2.CommandText :=
          ' SELECT ' +
          '   count(*) as QTDE_ITENS ' +
          ' FROM ' +
          '   PRODUTO_COMPOSICAO ' +
          ' WHERE ' +
          '   PRODUTO_COMPOSICAO.CODPRODUTO = ' + dmNFVenda.cdsNFVendaItemCODPRODUTO.AsString;
        dmAcesso.sqlVariant_2.Open;
        //
        totalItensCompostos := dmAcesso.sqlVariant_2.Fields[0].AsInteger;
        if totalItensCompostos > 0 then
          itemDetalhado := True;
      end;
      //
      if (itemDetalhado = false) then
      begin
        inc(i);
        with Det.Add do
        begin
          Prod.nItem := i;
          Prod.cProd := dmNFVenda.cdsNFVendaItemCODPESQUISA.AsString;
          Prod.cEAN := dmNFVenda.cdsNFVendaItemPRO_EAN13.AsString;
          Prod.cEANTrib := dmNFVenda.cdsNFVendaItemPRO_EAN13.AsString;

          Prod.xProd := dmNFVenda.cdsNFVendaItemPRO_DESCRICAO.AsString;
          //
          if (dmNFVenda.cdsNFVendaItemCODCFOP.AsString <> '') then
            Prod.CFOP := dmNFVenda.cdsNFVendaItemCODCFOP.AsString
          else
            Prod.CFOP := dmNFVenda.cdsNFVendaCODCFOP.AsString;
          //
          if (dmConfiguracao.getStr('PRO.UND.NFE') = 'S') then
          begin
            Prod.uCom := dmNFVenda.cdsNFVendaItemUND_COMP.AsString;
            Prod.qCom := dmNFVenda.cdsNFVendaItemNFVI_QTDE_UND.AsCurrency;
            Prod.vUnCom := dmNFVenda.cdsNFVendaItemNFVI_VLR_UND.AsCurrency;

            Prod.uTrib := dmNFVenda.cdsNFVendaItemUND_COMP.AsString;
            Prod.qTrib := dmNFVenda.cdsNFVendaItemNFVI_QTDE_UND.AsCurrency;
            Prod.vUnTrib := dmNFVenda.cdsNFVendaItemNFVI_VLR_UND.AsCurrency;
          end
          else
          begin
            Prod.uCom := dmNFVenda.cdsNFVendaItemNFVI_UNIDADE.AsString;
            Prod.qCom := dmNFVenda.cdsNFVendaItemNFVI_QTDE.AsCurrency;
            Prod.vUnCom := dmNFVenda.cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency;

            Prod.uTrib := dmNFVenda.cdsNFVendaItemNFVI_UNIDADE.AsString;
            Prod.qTrib := dmNFVenda.cdsNFVendaItemNFVI_QTDE.AsCurrency;
            Prod.vUnTrib := dmNFVenda.cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency;
          end;
          //
          if (dmConfiguracao.getStr('NF.IMPORT') = 'S') then
          begin
            //Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add
            with Prod.DI.Add do
            begin
              nDi := dmNFVenda.cdsNFVendaItemNFVI_DI_NUMERO.AsString;
              dDi := dmNFVenda.cdsNFVendaItemNFVI_DI_DATA_REGISTRO.AsDateTime; //FormatDateTime('dd/mm/yyyy', );
              xLocDesemb := dmNFVenda.cdsNFVendaItemNFVI_DI_LOCAL_DESEMB.AsString;
              UFDesemb := dmNFVenda.cdsNFVendaItemNFVI_DI_UF_DESEMB.AsString;
              dDesemb := dmNFVenda.cdsNFVendaItemNFVI_DI_DATA_DESEMB.AsDateTime; //FormatDateTime('dd/mm/yyyy', );
              cExportador := dmNFVenda.cdsNFVendaItemNFVI_DI_COD_EXPORTADOR.AsString;
              with adi.Add do
              begin
                nAdicao := 1;
                nSeqAdi := 1;
                cFabricante := IntToStr(dmNFVenda.cdsNFVendaItemCODFABRICANTE.AsInteger);
                vDescDI := 0;
              end;
            end;
          end;
          //
          Prod.vProd := RoundTo(dmNFVenda.NFVENDAITEM_TotalItem, -2);
          Prod.vDesc := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency, -2);
          //
          perItem := 0;
          //
          if (dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency > 0) then
          begin
            perItem :=
              (dmNFVenda.cdsNFVendaItemNFVI_TOTAL.AsCurrency * 100) /
              dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency;
          end;
          //
          if perItem > 0 then
          begin
            if dmNFVenda.cdsNFVendaNFV_TP_FRETE.AsString = 'FOB' then
            begin
              //
              Prod.vFrete := RoundTo((dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency * perItem) / 100, -2);
              freteRateio := freteRateio + Prod.vFrete;
              //
              if (dmNFVenda.cdsNFVendaItem.RecNo = dmNFVenda.cdsNFVendaItem.RecordCount) then
              begin
                if freteRateio > dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency then
                  Prod.vFrete := Prod.vFrete - (freteRateio - dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency)
                else if freteRateio < dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency then
                  Prod.vFrete := Prod.vFrete - (dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency - freteRateio);
              end;
            end;
            //
            descontoTemp := 0;
            if dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency > 0 then
            begin
              descontoTemp := RoundTo((dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency * perItem) / 100, -2);
              descontotalRateio := descontotalRateio + descontoTemp;
              //
              if (dmNFVenda.cdsNFVendaItem.RecNo = dmNFVenda.cdsNFVendaItem.RecordCount) then
              begin
                if descontotalRateio > dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency then
                  descontoTemp := descontoTemp - (descontotalRateio - dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency)
                else if freteRateio < dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency then
                  descontoTemp := descontoTemp - (dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency - descontotalRateio);
              end;
              Prod.vDesc := descontoTemp + RoundTo(dmNFVenda.cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency, -2);
            end;
          end;
          //
          vdescitens := vdescitens + dmNFVenda.cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency;
          //
          if dmNFVenda.cdsNFVendaItemPRO_NCM.AsString <> '' then
            Prod.NCM := dmNFVenda.cdsNFVendaItemPRO_NCM.AsString;
          if dmNFVenda.cdsNFVendaItemNFVI_CEST.AsString <> '' then
            Prod.CEST := dmNFVenda.cdsNFVendaItemNFVI_CEST.AsString;
          infAdProd := '';
          ////////////////////////////////////////////////////////////////////////
          with Imposto do
          begin

            if (
              (cdsNFVendaNFV_TIPO.AsString = 'S') and
              not (cdsNFVendaCFOP_CLASSIFICACAO.AsString = 'Devolução') and
              (dmConfiguracao.getStr('NF.LEI.IMP') = 'S')
              )
              then
            begin
              AAliqTrib := dmProduto.retornarAliqNCM(dmNFVenda.cdsNFVendaItemCODPRODUTO.AsInteger);
              if AAliqTrib > 0 then
                ValorTribItemAproximado := (AAliqTrib * dmNFVenda.cdsNFVendaItemNFVI_TOTAL.AsCurrency) / 100;
              // Informar o valor aproximado em cada item
              if ValorTribItemAproximado > 0 then
                vTotTrib := RoundTo(ValorTribItemAproximado, -2);
            end;
            //
            if (dmConfiguracao.getStr('NF.IMPORT') = 'S') then
            begin
              with II do
              begin
                vBc := dmNFVenda.cdsNFVendaItemNFVI_II_BC.AsCurrency;
                vDespAdu := dmNFVenda.cdsNFVendaItemNFVI_II_DESP_ADUANEIRAS.AsCurrency;
                vII := dmNFVenda.cdsNFVendaItemNFVI_II_VLR.AsCurrency;
                vIOF := dmNFVenda.cdsNFVendaItemNFVI_IOF_VLR.AsCurrency;
              end;
            end;
            //
            if dmNFVenda.cdsNFVendaItemNFVI_PIS_VLR.AsCurrency > 0 then
            begin
              with PIS do
              begin
                CST := pis01;
                if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '01' then
                  CST := pis01
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '02' then
                  CST := pis02
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '03' then
                  CST := pis03
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '04' then
                  CST := pis04
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '05' then
                  CST := pis05
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '06' then
                  CST := pis06
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '07' then
                  CST := pis07
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '08' then
                  CST := pis08
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '09' then
                  CST := pis09
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '49' then
                  CST := pis49
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '50' then
                  CST := pis50
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '51' then
                  CST := pis51
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '52' then
                  CST := pis52
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '53' then
                  CST := pis53
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '54' then
                  CST := pis54
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '55' then
                  CST := pis55
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '56' then
                  CST := pis56
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '60' then
                  CST := pis60
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '61' then
                  CST := pis61
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '62' then
                  CST := pis62
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '63' then
                  CST := pis63
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '64' then
                  CST := pis64
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '65' then
                  CST := pis65
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '66' then
                  CST := pis66
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '67' then
                  CST := pis67
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '70' then
                  CST := pis70
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '71' then
                  CST := pis71
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '72' then
                  CST := pis72
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '73' then
                  CST := pis73
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '74' then
                  CST := pis74
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '75' then
                  CST := pis75
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '98' then
                  CST := pis98
                else if dmNFVenda.cdsNFVendaItemNFVI_PIS_CST.AsString = '99' then
                  CST := pis99
                else
                  CST := pis01;
                //
                PIS.vBC := dmNFVenda.cdsNFVendaItemNFVI_PIS_BC.AsCurrency;
                PIS.pPIS := dmNFVenda.cdsNFVendaItemNFVI_PIS_PER.AsCurrency;
                PIS.vPIS := dmNFVenda.cdsNFVendaItemNFVI_PIS_VLR.AsCurrency;
                vTotalPIS := vTotalPIS + dmNFVenda.cdsNFVendaItemNFVI_PIS_VLR.AsCurrency;
              end;
            end
            else
              if (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional') then
                PIS.CST := pis99;
            //
            if dmNFVenda.cdsNFVendaItemNFVI_COFINS_VLR.AsCurrency > 0 then
            begin
              with COFINS do
              begin
                CST := cof01;
                if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '01' then
                  CST := cof01
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '02' then
                  CST := cof02
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '03' then
                  CST := cof03
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '04' then
                  CST := cof04
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '05' then
                  CST := cof05
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '06' then
                  CST := cof06
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '07' then
                  CST := cof07
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '08' then
                  CST := cof08
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '09' then
                  CST := cof09
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '49' then
                  CST := cof49
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '50' then
                  CST := cof50
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '51' then
                  CST := cof51
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '52' then
                  CST := cof52
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '53' then
                  CST := cof53
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '54' then
                  CST := cof54
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '55' then
                  CST := cof55
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '56' then
                  CST := cof56
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '60' then
                  CST := cof60
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '61' then
                  CST := cof61
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '62' then
                  CST := cof62
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '63' then
                  CST := cof63
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '64' then
                  CST := cof64
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '65' then
                  CST := cof65
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '66' then
                  CST := cof66
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '67' then
                  CST := cof67
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '70' then
                  CST := cof70
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '71' then
                  CST := cof71
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '72' then
                  CST := cof72
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '73' then
                  CST := cof73
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '74' then
                  CST := cof74
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '75' then
                  CST := cof75
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '98' then
                  CST := cof98
                else if dmNFVenda.cdsNFVendaItemNFVI_COFINS_CST.AsString = '99' then
                  CST := cof99
                else
                  CST := cof01;
                //
                COFINS.vBC := dmNFVenda.cdsNFVendaItemNFVI_COFINS_BC.AsCurrency;
                COFINS.pCOFINS := dmNFVenda.cdsNFVendaItemNFVI_COFINS_PER.AsCurrency;
                COFINS.vCOFINS := dmNFVenda.cdsNFVendaItemNFVI_COFINS_VLR.AsCurrency;
                //
                vTotalCOFINS := vTotalCOFINS + dmNFVenda.cdsNFVendaItemNFVI_COFINS_VLR.AsCurrency;
              end;
            end
            else
              if (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional') then
                COFINS.CST := cof99;

            //////////////////////////////////////////////////////////////////////
            with ICMS do
            begin
              //
              if (dmConfiguracao.getStr('NFE.CST.PROD') = 'S') then
              begin
                if dmNFVenda.cdsNFVendaItemPRO_CST.AsString = '' then
                  dmAcesso.d2kReator.Funcoes.Win.Error(
                    'Não foi informado o CST no Cadastro do seguinte Produto:' + #13 + #13 +
                    dmNFVenda.cdsNFVendaItemPRO_DESCRICAO.AsString
                    );
                //////////////////////////////////////////////////////////////////
                CstItem := dmNFVenda.cdsNFVendaItemNFVI_CST.AsString;
                if (CstItem = '') then
                  CstItem := dmNFVenda.cdsNFVendaItemPRO_CST.AsString;
                //////////////////////////////////////////////////////////////////
                if copy(CstItem, 2, 2) = '10' then
                  CST := cst10
                else if copy(CstItem, 2, 2) = '20' then
                  CST := cst20
                else if copy(CstItem, 2, 2) = '30' then
                  CST := cst30
                else if copy(CstItem, 2, 2) = '40' then
                  CST := cst40
                else if copy(CstItem, 2, 2) = '41' then
                  CST := cst41
                else if copy(CstItem, 2, 2) = '45' then
                  CST := cst45
                else if copy(CstItem, 2, 2) = '50' then
                  CST := cst50
                else if copy(CstItem, 2, 2) = '51' then
                  CST := cst51
                else if copy(CstItem, 2, 2) = '60' then
                  CST := cst60
                else if copy(CstItem, 2, 2) = '70' then
                  CST := cst70
                else if copy(CstItem, 2, 2) = '80' then
                  CST := cst80
                else if copy(CstItem, 2, 2) = '81' then
                  CST := cst81
                else if copy(CstItem, 2, 2) = '90' then
                  CST := cst90
                else // dmNFVenda.cdsNFVendaItemPRO_CST.AsString = '000' then ou demais
                  CST := cst00;
              end
              else
              begin
                if (AObsAdd = 1) or (AObsAdd = 2) or
                  (AObsAdd = 3) or (AObsAdd = 4) or
                  (AObsAdd = 5) or (AObsAdd = 6)
                  then
                  CST := cst41
                else
                  CST := cst00;
              end;


              if not ((cdsNFVendaCFOP_CLASSIFICACAO.AsString = 'Devolução')
                and
                ((cdsNFVendaCODCFOP.AsString = '5411') or
                (cdsNFVendaCODCFOP.AsString = '6411') or
                (cdsNFVendaCODCFOP.AsString = '5201') or
                (cdsNFVendaCODCFOP.AsString = '5202') or
                (cdsNFVendaCODCFOP.AsString = '6202') or
                (cdsNFVendaCODCFOP.AsString = '6201'))) and (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional') then
              begin
                if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '101' then
                  CSOSN := csosn101
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '102' then
                  CSOSN := csosn102
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '103' then
                  CSOSN := csosn103
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '201' then
                  CSOSN := csosn201
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '202' then
                  CSOSN := csosn202
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '203' then
                  CSOSN := csosn203
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '300' then
                  CSOSN := csosn300
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '400' then
                  CSOSN := csosn400
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '500' then
                  CSOSN := csosn500
                else if dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString = '900' then
                  CSOSN := csosn900
                else
                  dmAcesso.d2kReator.Funcoes.Win.Error(
                    'CSOSN Informado não valido:' +
                    dmNFVenda.cdsNFVendaItemNFVI_CSOSN.AsString
                    );
              end;
              ////////////////////////////////////////////////////////////////////
              dmAcesso.sqlVariant.Close;
              dmAcesso.sqlVariant.CommandText := 'SELECT coalesce(PRO_ICMS_ORIGEM, ''0'') as PRO_ICMS_ORIGEM FROM PRODUTO WHERE CODPRODUTO = ' + dmNFVenda.cdsNFVendaItemCODPRODUTO.AsString;
              dmAcesso.sqlVariant.Open;
              ////////////////////////////////////////////////////////////////////
//oeNacionalConteudoImportacaoSuperior70
              if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '1') then
                orig := oeEstrangeiraImportacaoDireta
              else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '2') then
                orig := oeEstrangeiraAdquiridaBrasil
              else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '3') then
                orig := oeNacionalConteudoImportacaoSuperior40
              else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '4') then
                orig := oeNacionalProcessosBasicos
              else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '5') then
                orig := oeNacionalConteudoImportacaoInferiorIgual40
              else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '6') then
                orig := oeEstrangeiraImportacaoDiretaSemSimilar
              else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '7') then
                orig := oeEstrangeiraAdquiridaBrasilSemSimilar
              else
                orig := oeNacional;


              if copy(CstItem, 2, 2) = '60' then
              begin
                vICMSSTRet := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ICMS.AsCurrency, -2);
              end
              else
              begin
                if (dmNFVenda.cdsNFVendaItemNFVI_MOD_BC.AsString = '0') then
                  modBC := dbiMargemValorAgregado
                else if (dmNFVenda.cdsNFVendaItemNFVI_MOD_BC.AsString = '1') then
                  modBC := dbiPauta
                else if (dmNFVenda.cdsNFVendaItemNFVI_MOD_BC.AsString = '3') then
                  modBC := dbiValorOperacao
                else
                  modBC := dbiPrecoTabelado;
                ////////////////////////////////////////////////////////////////////
                pICMS := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency, -2);
                vICMS := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ICMS.AsCurrency, -2);
              end;

              if copy(CstItem, 2, 2) = '60' then
              begin
                if (cdsNFVendaNFV_ALTERAR_BASE_ICMS.AsString = 'S') then
                begin
                  if (cdsNFVendaNFV_ICMS_BASE.AsCurrency > 0) then
                  begin
                    pCurTemp :=
                      RoundTo((dmNFVenda.cdsNFVendaNFV_ICMS_BASE.AsCurrency * perItem) / 100, -2);
                    vBCSTRet := pCurTemp;
                  end
                  else
                  begin
                    if dmNFVenda.cdsNFVendaItemNFVI_ICMS.AsCurrency > 0 then
                      vBCSTRet := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency, -2)
                    else
                      vBCSTRet := 0;
                  end;
                end
                else
                begin
                  if dmNFVenda.cdsNFVendaItemNFVI_ICMS.AsCurrency > 0 then
                    vBCSTRet := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency, -2)
                  else
                    vBCSTRet := 0;
                end;

              end
              else
              begin
                if (cdsNFVendaNFV_ALTERAR_BASE_ICMS.AsString = 'S') then
                begin
                  if (cdsNFVendaNFV_ICMS_BASE.AsCurrency > 0) then
                  begin
                    pCurTemp :=
                      RoundTo((dmNFVenda.cdsNFVendaNFV_ICMS_BASE.AsCurrency * perItem) / 100, -2);
                    vBC := pCurTemp;
                  end
                  else
                  begin
                    if dmNFVenda.cdsNFVendaItemNFVI_ICMS.AsCurrency > 0 then
                      vBC := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency, -2)
                    else
                      vBC := 0;
                  end;
                end
                else
                begin
                  if dmNFVenda.cdsNFVendaItemNFVI_ICMS.AsCurrency > 0 then
                    vBC := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency, -2)
                  else
                    vBC := 0;
                end;
              end;


              if dmNFVenda.cdsNFVendaItemNFVI_PER_REDUC.AsCurrency > 0 then
                pRedBC := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_PER_REDUC.AsCurrency, -2);
              //
              if (dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency > 0) then
              begin
                if (dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency > 0) then
                begin
                  perItem :=
                    (dmNFVenda.cdsNFVendaItemNFVI_TOTAL.AsCurrency * 100) /
                    dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency;
                end
                else
                  perItem := 0;

                //
                prod.vOutro := RoundTo((dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency * perItem) / 100, -2);
                outroRateio := outroRateio + Prod.vOutro;
                //
                if (dmNFVenda.cdsNFVendaItem.RecNo = dmNFVenda.cdsNFVendaItem.RecordCount) then
                begin
                  if outroRateio > dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency then
                    Prod.vOutro := Prod.vOutro - (outroRateio - dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency)
                  else if outroRateio < dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency then
                    Prod.vOutro := Prod.vOutro - (dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency - outroRateio);
                end;
              end;
              //
              if dmNFVenda.cdsNFVendaItemNFVI_SUBST_VLR.AsCurrency > 0 then
              begin
                vICMSST := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_SUBST_VLR.AsCurrency, -2);
              end;
              if dmNFVenda.cdsNFVendaItemNFVI_SUBST_BC.AsCurrency > 0 then
                vBCST := RoundTo(dmNFVenda.cdsNFVendaItemNFVI_SUBST_BC.AsCurrency, -2);
            end;


            //////////////////////////////////////////////////////////////////////
            with IPI do
            begin
              if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '00' then
                CST := ipi00
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '49' then
                CST := ipi49
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '50' then
                CST := ipi50
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '51' then
                CST := ipi51
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '52' then
                CST := ipi52
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '53' then
                CST := ipi53
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '54' then
                CST := ipi54
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '55' then
                CST := ipi55
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '99' then
                CST := ipi99
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '01' then
                CST := ipi01
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '02' then
                CST := ipi02
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '03' then
                CST := ipi03
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '04' then
                CST := ipi04
              else if dmNFVenda.cdsNFVendaItemNFVI_CST_IPI.AsString = '05' then
                CST := ipi05
              else
                CST := ipi01;
              //
              pIPI := dmNFVenda.cdsNFVendaItemNFVI_ALIQ_IPI.AsInteger;
              vIPI := dmNFVenda.cdsNFVendaItemNFVI_IPI.AsCurrency;
              if dmNFVenda.cdsNFVendaItemNFVI_IPI.AsCurrency > 0 then
                vBC := dmNFVenda.NFVENDAITEM_TotalItem
              else
                vBC := 0;
            end;
            //******************************************************************
            //******************************************************************
            if (Ide.finNFe = fnNormal) and
              (Ide.tpNF = tnSaida) and
              (Dest.EnderDest.UF <> Emit.EnderEmit.UF) and
              (Ide.indFinal = cfConsumidorFinal)
              then
            begin
              //Código Especificador da Substituição Tributária - CEST
              //if (ICMS.CST in [cst10, cst30, cst60, cst70, cst90])
              //   or
              //   (ICMS.CSOSN in [csosn201, csosn202, csosn203, csosn500, csosn900])
              //then
              //  ;
              //
              with ICMSUFDest do
              begin
                //Fundo de Combate à Pobreza (FCP)
                //Se existir a cobrança do FCP no destino, devemos calcular o valor do FCP e informar as seguintes tags:
                //pFCPUFDest com o percentual do FCP
                //vFCPUFDest com o valor do FCP ( pFCPUFDest x vBCUFDest )
                //vICMSUFDest com o valor do FCP + valor do ICMS do DIFAL do destino
                //Supondo que o FCP seja de 2%, teríamos os seguintes valores no exemplo anterior:
                //Tags do grupo XML ICMSUFDest:
                //vBCUFDest = 1000.00
                //pFCPUFDest = 2.00
                //pICMSUFDest = 17.00
                //pICMSInter = 12.00
                //pICMSInterPart = 40.00
                //vFCPUFDest = 20.00
                //vICMSUFDest = 20.00
                //vICMSUFRemet = 30.00
                ////////////////////////////////////////////////////////////////
                //1 - valor da mercadoria sem impostos
                //BC ICMS da operação interna na UF destino:
                //**************************************************************
                //Valor da Base de Cálculo do ICMS na UF de destino.
                //**************************************************************
                vBCUFDest := ICMS.vBC;
                ////////////////////////////////////////////////////////////////
                //2 - com o percentual do FCP
                //**************************************************************
                //Percentual adicional inserido na alíquota interna da UF de
                //destino, relativo ao Fundo de Combate à Pobreza (FCP) naquela
                //UF. Nota: Percentual máximo de 2%, conforme a legislação.
                //**************************************************************
                if (
                  (Dest.EnderDest.UF = 'BA') or
                  (Dest.EnderDest.UF = 'CE') or
                  (Dest.EnderDest.UF = 'GO') or
                  (Dest.EnderDest.UF = 'MG') or
                  (Dest.EnderDest.UF = 'MS') or
                  (Dest.EnderDest.UF = 'MT') or

                  (Dest.EnderDest.UF = 'PB') or
                  (Dest.EnderDest.UF = 'PE') or
                  (Dest.EnderDest.UF = 'PI') or
                  (Dest.EnderDest.UF = 'PR') or

                  (Dest.EnderDest.UF = 'RJ') or
                  (Dest.EnderDest.UF = 'RN') or
                  (Dest.EnderDest.UF = 'SE') or
                  (Dest.EnderDest.UF = 'TO')
                  )
                  then
                  pFCPUFDest := 2
                else
                  pFCPUFDest := 0;
                ////////////////////////////////////////////////////////////////
                //3 - Alíquota interna do ICMS da UF destino
                //**************************************************************
                //Alíquota adotada nas operações internas na UF de destino
                //para o produto / mercadoria. A alíquota do Fundo de Combate
                //a Pobreza, se existente para o produto / mercadoria, deve
                //ser informada no campo próprio (pFCPUFDest) não devendo
                //ser somada à essa alíquota interna.
                //**************************************************************
                pICMSUFDest := dmNFVenda.cdsNFVendaItemNFVI_ALIQ_ICMS_FORA.AsCurrency;
                ////////////////////////////////////////////////////////////////
                //4 - Alíquota interestadual das UF envolvidas:
                //- 4% alíquota interestadual para produtos importados;
                //- 7% para os Estados de origem do Sul e Sudeste (exceto ES),
                //destinado para os Estados do Norte, Nordeste, CentroOeste
                //e Espírito Santo;
                //- 12% para os demais casos
                if ICMS.orig = oeNacional then
                begin
                  //- 7% para os Estados de origem do Sul e Sudeste (exceto ES),
                  //destinado para os Estados do Norte, Nordeste, CentroOeste
                  //e Espírito Santo;
                  if
                    //Estados de origem do Sul
                  ((Emit.EnderEmit.UF = 'PR') or
                    (Emit.EnderEmit.UF = 'RS') or
                    (Emit.EnderEmit.UF = 'SC') or
                    //e Sudeste (exceto ES)
                    (Emit.EnderEmit.UF = 'MG') or
                    (Emit.EnderEmit.UF = 'RJ') or
                    (Emit.EnderEmit.UF = 'SP')
                    ) and
                    //Estados do Norte
                  ((Dest.EnderDest.UF = 'AC') or
                    (Dest.EnderDest.UF = 'AP') or
                    (Dest.EnderDest.UF = 'AM') or
                    (Dest.EnderDest.UF = 'PA') or
                    (Dest.EnderDest.UF = 'RO') or
                    (Dest.EnderDest.UF = 'RO') or
                    // Nordeste,
                    (Dest.EnderDest.UF = 'AL') or
                    (Dest.EnderDest.UF = 'BA') or
                    (Dest.EnderDest.UF = 'CE') or
                    (Dest.EnderDest.UF = 'MA') or
                    (Dest.EnderDest.UF = 'PB') or
                    (Dest.EnderDest.UF = 'PE') or
                    (Dest.EnderDest.UF = 'PI') or
                    (Dest.EnderDest.UF = 'RN') or
                    (Dest.EnderDest.UF = 'SE') or
                    // CentroOeste
                    (Dest.EnderDest.UF = 'DF') or
                    (Dest.EnderDest.UF = 'GO') or
                    (Dest.EnderDest.UF = 'MT') or
                    (Dest.EnderDest.UF = 'MS') or
                    // Espírito Santo
                    (Dest.EnderDest.UF = 'ES'))
                    then
                    pICMSInter := 7
                  else
                    pICMSInter := 12;
                end
                else
                  //- 4% alíquota interestadual para produtos importados;
                  pICMSInter := 4;
                ////////////////////////////////////////////////////////////////
                //5 - Percentual de ICMS Interestadual para a UF de destino
                if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2015) or
                  (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2014)
                  then
                  pICMSInterPart := 0
                else if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2016) then
                  pICMSInterPart := 40
                else if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2017) then
                  pICMSInterPart := 60
                else if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2018) then
                  pICMSInterPart := 80
                else
                  pICMSInterPart := 100;
                ////////////////////////////////////////////////////////////////
                //6 - com o valor do FCP ( pFCPUFDest x vBCUFDest )
                //**************************************************************
                //Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP)
                //da UF de destino.
                //**************************************************************
                vFCPUFDest := (vBCUFDest * pFCPUFDest / 100);
                if vBCUFDest > 0 then
                  vBCFCPUFDest := vBCUFDest;
                if (pICMSUFDest > 0) then
                begin
                  ////////////////////////////////////////////////////////////////
                  //7 - com o valor do FCP + valor do ICMS do DIFAL do destino
                  //destino
                  //**************************************************************
                  //Valor do ICMS Interestadual para a UF de destino, já
                  //considerando o valor do ICMS relativo ao Fundo de Combate
                  //à Pobreza naquela UF.
                  //**************************************************************
                  vICMSUFDest := ((((vBCUFDest * (pICMSUFDest - pICMSInter)) / 100) * pICMSInterPart) / 100);
                  totalVICMSUFDest := totalVICMSUFDest + vICMSUFDest;
                  ////////////////////////////////////////////////////////////////
                  //8 - remetente
                  //**************************************************************
                  //Valor do ICMS Interestadual para a UF do remetente.
                  //Nota: A partir de 2019, este valor será zero.
                  //**************************************************************
                  //((vBCUFDest * (pICMSUFDest - pICMSInter))/100)
                  vICMSUFRemet := ((((vBCUFDest * (pICMSUFDest - pICMSInter)) / 100) * (100 - pICMSInterPart)) / 100);
                end;

            (*
               <vBCUFDest>1000.00</vBCUFDest>
               <pFCPUFDest>2.00</pFCPUFDest>
               <pICMSUFDest>17.00</pICMSUFDest>
               <pICMSInter>12.00</pICMSInter>
               <pICMSInterPart>40.00</pICMSInterPart>
               <vFCPUFDest>20.00</vFCPUFDest>
               <vICMSUFDest>20.00</vICMSUFDest>
               <vICMSUFRemet>30.00</vICMSUFRemet>
            *)
              end;
            end
            else
            begin
              if (Ide.finNFe = fnNormal) and
                 (Ide.tpNF = tnSaida) and
                 (Ide.indFinal <> cfConsumidorFinal)
              then
              begin

                
              end;
            end;

            // -----------------------------------------------------------------
            if (Ide.tpNF = tnSaida) and
              (Dest.EnderDest.UF <> Emit.EnderEmit.UF)
              then
            begin
              if (dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency > 0) and (ICMS.vICMSST > 0) then
              begin
                ICMS.vBCFCPST := ICMS.vICMSST;
                ICMS.pFCPST := dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency;
                ICMS.vFCPST := (ICMS.vBCFCPST * ICMS.pFCPST / 100);
                vTotalICMSSTFCP := vTotalICMSSTFCP + ICMS.vFCPST;
              end;
              if (dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency > 0) and (ICMS.vBC > 0) then
              begin
                ICMS.vBCFCP := ICMS.vBC;
                ICMS.pFCP := dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency;
                ICMS.vFCP := (ICMS.vBCFCP * ICMS.pFCP / 100);
                vTotalICMSFCP := vTotalICMSFCP + ICMS.vFCP;
              end;
              if (dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency > 0) and
                (ICMSUFDest.vBCUFDest > 0) then
              begin
                ICMSUFDest.vBCFCPUFDest := ICMSUFDest.vBCUFDest;
                ICMSUFDest.pFCPUFDest := dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency;
                ICMSUFDest.vFCPUFDest := (ICMSUFDest.vBCFCPUFDest * ICMSUFDest.pFCPUFDest / 100);
              end;
            end;

            vTotalICMSUFFCP := vTotalICMSUFFCP + ICMSUFDest.vFCPUFDest;


            //******************************************************************
            //******************************************************************
          end;
        end;
      end
      else
      begin
        dmAcesso.sqlVariant_2.Close;
        dmAcesso.sqlVariant_2.CommandText :=
          ' SELECT ' +
          '   PRODUTO.CODPRODUTO, ' +
          '   PRODUTO.PRO_CODPESQ_1 as CODPESQUISA, ' +
          '   PRODUTO.PRO_DESCRICAO, PRODUTO_COMPOSICAO.proc_qtde, ' +
          '   PRODUTO.PRO_NCM, ' +
          '   PRODUTO.PRO_CST, PRODUTO.PRO_CST as NFVI_CST, ' +
          '   PRODUTO.PRO_ICMS_ORIGEM, coalesce(PRO_ALIQ_ICMS, 0) as NFVI_ALIQ_ICMS ' +
          '   , ' + QuotedStr(dmNFVenda.cdsNFVendaItemCODCFOP.AsString) + ' as CODCFOP ' +
          '   , 0 as NFVI_II_BC ' +
          '   , 0 as NFVI_II_DESP_ADUANEIRAS ' +
          ', 0 as NFVI_II_VLR ' +
          ', 0 as NFVI_IOF_VLR ' +
          ', 0 as NFVI_PIS_VLR ' +
          ', 0 as NFVI_PIS_CST ' +
          ', 0 as NFVI_PIS_BC ' +
          ', 0 as NFVI_PIS_PER ' +
          ', 0 as NFVI_PIS_VLR ' +
          ', 0 as NFVI_COFINS_VLR ' +
          ', 0 as NFVI_COFINS_CST ' +
          ', 0 as NFVI_COFINS_BC ' +
          ', 0 as NFVI_COFINS_PER ' +
          ', 0 as NFVI_COFINS_VLR ' +
          ', 0 as NFVI_SUBST_VLR ' +
          ', 0 as NFVI_SUBST_BC ' +
          ', 0 as NFVI_CST_IPI ' +
          ', 0 as NFVI_ALIQ_IPI ' +
          ', 0 as NFVI_IPI ';

        dmAcesso.sqlVariant_2.CommandText := dmAcesso.sqlVariant_2.CommandText +
          ' FROM ' +
          '   PRODUTO_COMPOSICAO ' +
          '   INNER JOIN PRODUTO ON (PRODUTO_COMPOSICAO.CODPRODUTOFILHO = PRODUTO.CODPRODUTO) ' +
          ' WHERE ' +
          '   PRODUTO_COMPOSICAO.CODPRODUTO =  ' + dmNFVenda.cdsNFVendaItemCODPRODUTO.AsString;
        dmAcesso.sqlVariant_2.Open;
        totalcomp := 0;
        itemcomposto := 0;
        while not (dmAcesso.sqlVariant_2.Eof) do
        begin
          inc(i);
          inc(itemcomposto);
          with Det.Add do
          begin
            Prod.nItem := i;
            Prod.cProd := dmAcesso.sqlVariant_2.FieldByName('CODPESQUISA').AsString;
            Prod.xProd := dmAcesso.sqlVariant_2.FieldByName('PRO_DESCRICAO').AsString;
            //
            if (dmAcesso.sqlVariant_2.FieldByName('CODCFOP').AsString <> '') then
              Prod.CFOP := dmAcesso.sqlVariant_2.FieldByName('CODCFOP').AsString
            else
              Prod.CFOP := dmNFVenda.cdsNFVendaCODCFOP.AsString;
            //
            if (dmConfiguracao.getStr('PRO.UND.NFE') = 'S') then
            begin
              Prod.uCom := dmNFVenda.cdsNFVendaItemUND_COMP.AsString;
              Prod.qCom := dmNFVenda.cdsNFVendaItemNFVI_QTDE_UND.AsCurrency;
              Prod.vUnCom := dmNFVenda.cdsNFVendaItemNFVI_VLR_UND.AsCurrency;
            end
            else
            begin
              Prod.uCom := dmNFVenda.cdsNFVendaItemNFVI_UNIDADE.AsString;
              Prod.qCom := dmNFVenda.cdsNFVendaItemNFVI_QTDE.AsCurrency;
              Prod.vUnCom := dmNFVenda.cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency;
            end;
            //
            totalitemtemp := RoundTo(Prod.vUnCom / totalItensCompostos, -2);
            totalcomp := totalcomp + totalitemtemp;
            if (itemcomposto = dmAcesso.sqlVariant_2.RecordCount) then
            begin
              if totalcomp > Prod.vUnCom then
                totalitemtemp := totalitemtemp - (totalcomp - Prod.vUnCom)
              else if totalcomp < Prod.vUnCom then
                totalitemtemp := totalitemtemp + (Prod.vUnCom - totalcomp);
            end;
            //
            Prod.vUnCom := totalitemtemp / dmAcesso.sqlVariant_2.FieldByName('PROC_QTDE').AsCurrency;
            Prod.qCom := dmAcesso.sqlVariant_2.FieldByName('PROC_QTDE').AsCurrency * Prod.qCom;
            //
            Prod.uTrib := Prod.uCom;
            Prod.qTrib := Prod.qCom;
            Prod.vUnTrib := Prod.vUnCom;
            //
            if (dmConfiguracao.getStr('NF.IMPORT') = 'S') then
            begin
              //Declaração de Importação. Pode ser adicionada várias através do comando Prod.DI.Add
              with Prod.DI.Add do
              begin
                nDi := dmNFVenda.cdsNFVendaItemNFVI_DI_NUMERO.AsString;
                dDi := dmNFVenda.cdsNFVendaItemNFVI_DI_DATA_REGISTRO.AsDateTime; //FormatDateTime('dd/mm/yyyy', );
                xLocDesemb := dmNFVenda.cdsNFVendaItemNFVI_DI_LOCAL_DESEMB.AsString;
                UFDesemb := dmNFVenda.cdsNFVendaItemNFVI_DI_UF_DESEMB.AsString;
                dDesemb := dmNFVenda.cdsNFVendaItemNFVI_DI_DATA_DESEMB.AsDateTime; //FormatDateTime('dd/mm/yyyy', );
                cExportador := dmNFVenda.cdsNFVendaItemNFVI_DI_COD_EXPORTADOR.AsString;
                with adi.Add do
                begin
                  nAdicao := 1;
                  nSeqAdi := 1;
                  cFabricante := IntToStr(dmNFVenda.cdsNFVendaItemCODFABRICANTE.AsInteger);
                  vDescDI := 0;
                end;
              end;
            end;
            //
            perItem := 0;
            //
            if (dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency > 0) then
            begin
              perItem :=
                ((Prod.vUnCom * Prod.qCom) * 100) /
                dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency;
            end;
            //
            Prod.vProd := RoundTo(Prod.vUnCom * Prod.qCom, -2);
            Prod.vDesc := RoundTo((dmNFVenda.cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency * perItem) / 100, -2);
            //
            if perItem > 0 then
            begin
              if dmNFVenda.cdsNFVendaNFV_TP_FRETE.AsString = 'FOB' then
              begin
                //
                Prod.vFrete := RoundTo((dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency * perItem) / 100, -2);
                freteRateio := freteRateio + Prod.vFrete;
                //
                if (itemcomposto = dmAcesso.sqlVariant_2.RecordCount) then
                begin
                  if freteRateio > dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency then
                    Prod.vFrete := Prod.vFrete - (freteRateio - dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency)
                  else if freteRateio < dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency then
                    Prod.vFrete := Prod.vFrete - (dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency - freteRateio);
                end;
              end;
              //
              descontoTemp := 0;
              if dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency > 0 then
              begin
                descontoTemp := RoundTo((dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency * perItem) / 100, -2);
                descontotalRateio := descontotalRateio + descontoTemp;
                //
                if (itemcomposto = dmAcesso.sqlVariant_2.RecordCount) then
                begin
                  if descontotalRateio > dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency then
                    descontoTemp := descontoTemp - (descontotalRateio - dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency)
                  else if descontotalRateio < dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency then
                    descontoTemp := descontoTemp - (dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency - descontotalRateio);
                end;
                Prod.vDesc := descontoTemp + RoundTo(Prod.vDesc, -2);
              end;
            end;
            //
            vdescitens := vdescitens + Prod.vDesc;
            //
            if dmAcesso.sqlVariant_2.FieldByName('PRO_NCM').AsString <> '' then
              Prod.NCM := dmAcesso.sqlVariant_2.FieldByName('PRO_NCM').AsString;
            infAdProd := '';
            ////////////////////////////////////////////////////////////////////////
            with Imposto do
            begin
              if (
                (cdsNFVendaNFV_TIPO.AsString = 'S') and
                not (cdsNFVendaCFOP_CLASSIFICACAO.AsString = 'Devolução') and
                (dmConfiguracao.getStr('NF.LEI.IMP') = 'S')
                )
                then
              begin
                AAliqTrib := dmProduto.retornarAliqNCM(dmAcesso.sqlVariant_2.FieldByName('CODPRODUTO').AsInteger);
                if AAliqTrib > 0 then
                  ValorTribItemAproximado := (AAliqTrib * totalitemtemp) / 100;
                // Informar o valor aproximado em cada item
                if ValorTribItemAproximado > 0 then
                  vTotTrib := RoundTo(ValorTribItemAproximado, -2);
              end;

              if (dmConfiguracao.getStr('NF.IMPORT') = 'S') then
              begin
                with II do
                begin
                  vBc := dmAcesso.sqlVariant_2.FieldByName('NFVI_II_BC').AsCurrency;
                  vDespAdu := dmAcesso.sqlVariant_2.FieldByName('NFVI_II_DESP_ADUANEIRAS').AsCurrency;
                  vII := dmAcesso.sqlVariant_2.FieldByName('NFVI_II_VLR').AsCurrency;
                  vIOF := dmAcesso.sqlVariant_2.FieldByName('NFVI_IOF_VLR').AsCurrency;
                end;
              end;
              //
              if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_VLR').AsCurrency > 0 then
              begin
                with PIS do
                begin
                  CST := pis01;
                  if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '01' then
                    CST := pis01
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '02' then
                    CST := pis02
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '03' then
                    CST := pis03
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '04' then
                    CST := pis04
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '05' then
                    CST := pis05
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '06' then
                    CST := pis06
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '07' then
                    CST := pis07
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '08' then
                    CST := pis08
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '09' then
                    CST := pis09
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '49' then
                    CST := pis49
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '50' then
                    CST := pis50
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '51' then
                    CST := pis51
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '52' then
                    CST := pis52
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '53' then
                    CST := pis53
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '54' then
                    CST := pis54
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '55' then
                    CST := pis55
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '56' then
                    CST := pis56
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '60' then
                    CST := pis60
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '61' then
                    CST := pis61
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '62' then
                    CST := pis62
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '63' then
                    CST := pis63
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '64' then
                    CST := pis64
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '65' then
                    CST := pis65
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '66' then
                    CST := pis66
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '67' then
                    CST := pis67
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '70' then
                    CST := pis70
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '71' then
                    CST := pis71
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '72' then
                    CST := pis72
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '73' then
                    CST := pis73
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '74' then
                    CST := pis74
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '75' then
                    CST := pis75
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '98' then
                    CST := pis98
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_CST').AsString = '99' then
                    CST := pis99
                  else
                    CST := pis01;
                  //
                  PIS.vBC := dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_BC').AsCurrency;
                  PIS.pPIS := dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_PER').AsCurrency;
                  PIS.vPIS := dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_VLR').AsCurrency;
                  vTotalPIS := vTotalPIS + dmAcesso.sqlVariant_2.FieldByName('NFVI_PIS_VLR').AsCurrency;
                end;
              end
              else
                if (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional') then
                  PIS.CST := pis99;
              //
              if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_VLR').AsCurrency > 0 then
              begin
                with COFINS do
                begin
                  CST := cof01;
                  if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '01' then
                    CST := cof01
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '02' then
                    CST := cof02
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '03' then
                    CST := cof03
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '04' then
                    CST := cof04
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '05' then
                    CST := cof05
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '06' then
                    CST := cof06
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '07' then
                    CST := cof07
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '08' then
                    CST := cof08
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '09' then
                    CST := cof09
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '49' then
                    CST := cof49
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '50' then
                    CST := cof50
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '51' then
                    CST := cof51
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '52' then
                    CST := cof52
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '53' then
                    CST := cof53
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '54' then
                    CST := cof54
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '55' then
                    CST := cof55
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '56' then
                    CST := cof56
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '60' then
                    CST := cof60
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '61' then
                    CST := cof61
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '62' then
                    CST := cof62
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '63' then
                    CST := cof63
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '64' then
                    CST := cof64
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '65' then
                    CST := cof65
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '66' then
                    CST := cof66
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '67' then
                    CST := cof67
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '70' then
                    CST := cof70
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '71' then
                    CST := cof71
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '72' then
                    CST := cof72
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '73' then
                    CST := cof73
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '74' then
                    CST := cof74
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '75' then
                    CST := cof75
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '98' then
                    CST := cof98
                  else if dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_CST').AsString = '99' then
                    CST := cof99
                  else
                    CST := cof01;
                  //
                  COFINS.vBC := dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_BC').AsCurrency;
                  COFINS.pCOFINS := dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_PER').AsCurrency;
                  COFINS.vCOFINS := dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_VLR').AsCurrency;
                  //
                  vTotalCOFINS := vTotalCOFINS + dmAcesso.sqlVariant_2.FieldByName('NFVI_COFINS_VLR').AsCurrency;
                end;
              end
              else
                if (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional') then
                  COFINS.CST := cof99;
              //////////////////////////////////////////////////////////////////////
              with ICMS do
              begin
                //
                if (dmConfiguracao.getStr('NFE.CST.PROD') = 'S') then
                begin
                  if dmAcesso.sqlVariant_2.FieldByName('PRO_CST').AsString = '' then
                    dmAcesso.d2kReator.Funcoes.Win.Error(
                      'Não foi informado o CST no Cadastro do seguinte Produto:' + #13 + #13 +
                      dmAcesso.sqlVariant_2.FieldByName('PRO_DESCRICAO').AsString
                      );
                  //////////////////////////////////////////////////////////////////
                  CstItem := dmAcesso.sqlVariant_2.FieldByName('NFVI_CST').AsString;
                  if (CstItem = '') then
                    CstItem := dmAcesso.sqlVariant_2.FieldByName('PRO_CST').AsString;
                  //////////////////////////////////////////////////////////////////
                  if copy(CstItem, 2, 2) = '10' then
                    CST := cst10
                  else if copy(CstItem, 2, 2) = '20' then
                    CST := cst20
                  else if copy(CstItem, 2, 2) = '30' then
                    CST := cst30
                  else if copy(CstItem, 2, 2) = '40' then
                    CST := cst40
                  else if copy(CstItem, 2, 2) = '41' then
                    CST := cst41
                  else if copy(CstItem, 2, 2) = '45' then
                    CST := cst45
                  else if copy(CstItem, 2, 2) = '50' then
                    CST := cst50
                  else if copy(CstItem, 2, 2) = '51' then
                    CST := cst51
                  else if copy(CstItem, 2, 2) = '60' then
                    CST := cst60
                  else if copy(CstItem, 2, 2) = '70' then
                    CST := cst70
                  else if copy(CstItem, 2, 2) = '80' then
                    CST := cst80
                  else if copy(CstItem, 2, 2) = '81' then
                    CST := cst81
                  else if copy(CstItem, 2, 2) = '90' then
                    CST := cst90
                  else // dmAcesso.sqlVariant_2.FieldByName('PRO_CST.AsString = '000' then ou demais
                    CST := cst00;
                end
                else
                begin
                  if (AObsAdd = 1) or (AObsAdd = 2) or
                    (AObsAdd = 3) or (AObsAdd = 4) or
                    (AObsAdd = 5) or (AObsAdd = 6)
                    then
                    CST := cst41
                  else
                    CST := cst00;
                end;
                ////////////////////////////////////////////////////////////////////
                dmAcesso.sqlVariant.Close;
                dmAcesso.sqlVariant.CommandText := 'SELECT coalesce(PRO_ICMS_ORIGEM, ''0'') as PRO_ICMS_ORIGEM FROM PRODUTO WHERE CODPRODUTO = ' + dmAcesso.sqlVariant_2.FieldByName('CODPRODUTO').AsString;
                dmAcesso.sqlVariant.Open;
                ////////////////////////////////////////////////////////////////////
                if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '1') then
                  orig := oeEstrangeiraImportacaoDireta
                else if (dmAcesso.sqlVariant.FieldByName('PRO_ICMS_ORIGEM').AsString = '2') then
                  orig := oeEstrangeiraAdquiridaBrasil
                else
                  orig := oeNacional;
                ////////////////////////////////////////////////////////////////////
                if (dmNFVenda.cdsNFVendaItemNFVI_MOD_BC.AsString = '0') then
                  modBC := dbiMargemValorAgregado
                else if (dmNFVenda.cdsNFVendaItemNFVI_MOD_BC.AsString = '1') then
                  modBC := dbiPauta
                else if (dmNFVenda.cdsNFVendaItemNFVI_MOD_BC.AsString = '3') then
                  modBC := dbiValorOperacao
                else
                  modBC := dbiPrecoTabelado;
                ////////////////////////////////////////////////////////////////////
                pICMS := RoundTo(dmAcesso.sqlVariant_2.FieldByName('NFVI_ALIQ_ICMS').AsCurrency, -2);
                vBC := RoundTo(Prod.vProd, -2);
                vICMS := RoundTo(((vBC * pICMS) / 100), -2);
                //
                if (dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency > 0) then
                begin
                  if (dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency > 0) then
                  begin
                    perItem :=
                      ((Prod.vUnCom * Prod.qCom) * 100) /
                      dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency;
                  end
                  else
                    perItem := 0;

                  //
                  prod.vOutro := RoundTo((dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency * perItem) / 100, -2);
                  outroRateio := outroRateio + Prod.vOutro;
                  //
                  if (itemcomposto = dmAcesso.sqlVariant_2.RecordCount) then
                  begin
                    if outroRateio > dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency then
                      Prod.vOutro := Prod.vOutro - (outroRateio - dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency)
                    else if outroRateio < dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency then
                      Prod.vOutro := Prod.vOutro - (dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency - outroRateio);
                  end;
                end;
                //
                if dmAcesso.sqlVariant_2.FieldByName('NFVI_SUBST_VLR').AsCurrency > 0 then
                  vICMSST := RoundTo(dmAcesso.sqlVariant_2.FieldByName('NFVI_SUBST_VLR').AsCurrency, -2);
                if dmAcesso.sqlVariant_2.FieldByName('NFVI_SUBST_BC').AsCurrency > 0 then
                  vBCST := RoundTo(dmAcesso.sqlVariant_2.FieldByName('NFVI_SUBST_BC').AsCurrency, -2);
              end;
              //////////////////////////////////////////////////////////////////////
              with IPI do
              begin
                if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '00' then
                  CST := ipi00
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '49' then
                  CST := ipi49
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '50' then
                  CST := ipi50
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '51' then
                  CST := ipi51
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '52' then
                  CST := ipi52
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '53' then
                  CST := ipi53
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '54' then
                  CST := ipi54
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '55' then
                  CST := ipi55
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '99' then
                  CST := ipi99
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '01' then
                  CST := ipi01
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '02' then
                  CST := ipi02
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '03' then
                  CST := ipi03
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '04' then
                  CST := ipi04
                else if dmAcesso.sqlVariant_2.FieldByName('NFVI_CST_IPI').AsString = '05' then
                  CST := ipi05
                else
                  CST := ipi01;
                //
                pIPI := dmAcesso.sqlVariant_2.FieldByName('NFVI_ALIQ_IPI').AsInteger;
                vIPI := dmAcesso.sqlVariant_2.FieldByName('NFVI_IPI').AsCurrency;
                if dmAcesso.sqlVariant_2.FieldByName('NFVI_IPI').AsCurrency > 0 then
                  vBC := (Prod.vUnCom * Prod.qCom)
                else
                  vBC := 0;
              end;
              //******************************************************************
              //******************************************************************
              if (Ide.finNFe = fnNormal) and
                (Ide.tpNF = tnSaida) and
                (Dest.EnderDest.UF <> Emit.EnderEmit.UF)
                then
              begin
                //Código Especificador da Substituição Tributária - CEST
                //if (ICMS.CST in [cst10, cst30, cst60, cst70, cst90])
                //   or
                //   (ICMS.CSOSN in [csosn201, csosn202, csosn203, csosn500, csosn900])
                //then
                //  ;
                //
                with ICMSUFDest do
                begin
                  //Fundo de Combate à Pobreza (FCP)
                  //Se existir a cobrança do FCP no destino, devemos calcular o valor do FCP e informar as seguintes tags:
                  //pFCPUFDest com o percentual do FCP
                  //vFCPUFDest com o valor do FCP ( pFCPUFDest x vBCUFDest )
                  //vICMSUFDest com o valor do FCP + valor do ICMS do DIFAL do destino
                  //Supondo que o FCP seja de 2%, teríamos os seguintes valores no exemplo anterior:
                  //Tags do grupo XML ICMSUFDest:
                  //vBCUFDest = 1000.00
                  //pFCPUFDest = 2.00
                  //pICMSUFDest = 17.00
                  //pICMSInter = 12.00
                  //pICMSInterPart = 40.00
                  //vFCPUFDest = 20.00
                  //vICMSUFDest = 20.00
                  //vICMSUFRemet = 30.00
                  ////////////////////////////////////////////////////////////////
                  //1 - valor da mercadoria sem impostos
                  //BC ICMS da operação interna na UF destino:
                  //**************************************************************
                  //Valor da Base de Cálculo do ICMS na UF de destino.
                  //**************************************************************
                  vBCUFDest := ICMS.vBC;
                  ////////////////////////////////////////////////////////////////
                  //2 - com o percentual do FCP
                  //**************************************************************
                  //Percentual adicional inserido na alíquota interna da UF de
                  //destino, relativo ao Fundo de Combate à Pobreza (FCP) naquela
                  //UF. Nota: Percentual máximo de 2%, conforme a legislação.
                  //**************************************************************
                  if (
                    (Dest.EnderDest.UF = 'BA') or
                    (Dest.EnderDest.UF = 'CE') or
                    (Dest.EnderDest.UF = 'GO') or
                    (Dest.EnderDest.UF = 'MG') or
                    (Dest.EnderDest.UF = 'MS') or
                    (Dest.EnderDest.UF = 'MT') or

                    (Dest.EnderDest.UF = 'PB') or
                    (Dest.EnderDest.UF = 'PE') or
                    (Dest.EnderDest.UF = 'PI') or
                    (Dest.EnderDest.UF = 'PR') or

                    (Dest.EnderDest.UF = 'RJ') or
                    (Dest.EnderDest.UF = 'RN') or
                    (Dest.EnderDest.UF = 'SE') or
                    (Dest.EnderDest.UF = 'TO')
                    )
                    then
                    pFCPUFDest := 2
                  else
                    pFCPUFDest := 0;
                  ////////////////////////////////////////////////////////////////
                  //3 - Alíquota interna do ICMS da UF destino
                  //**************************************************************
                  //Alíquota adotada nas operações internas na UF de destino
                  //para o produto / mercadoria. A alíquota do Fundo de Combate
                  //a Pobreza, se existente para o produto / mercadoria, deve
                  //ser informada no campo próprio (pFCPUFDest) não devendo
                  //ser somada à essa alíquota interna.
                  //**************************************************************
                  pICMSUFDest := 0;
                  ////////////////////////////////////////////////////////////////
                  //4 - Alíquota interestadual das UF envolvidas:
                  //- 4% alíquota interestadual para produtos importados;
                  //- 7% para os Estados de origem do Sul e Sudeste (exceto ES),
                  //destinado para os Estados do Norte, Nordeste, CentroOeste
                  //e Espírito Santo;
                  //- 12% para os demais casos
                  if ICMS.orig = oeNacional then
                  begin
                    //- 7% para os Estados de origem do Sul e Sudeste (exceto ES),
                    //destinado para os Estados do Norte, Nordeste, CentroOeste
                    //e Espírito Santo;
                    if
                      //Estados de origem do Sul
                    ((Emit.EnderEmit.UF = 'PR') or
                      (Emit.EnderEmit.UF = 'RS') or
                      (Emit.EnderEmit.UF = 'SC') or
                      //e Sudeste (exceto ES)
                      (Emit.EnderEmit.UF = 'MG') or
                      (Emit.EnderEmit.UF = 'RJ') or
                      (Emit.EnderEmit.UF = 'SP')
                      ) and
                      //Estados do Norte
                    ((Dest.EnderDest.UF = 'AC') or
                      (Dest.EnderDest.UF = 'AP') or
                      (Dest.EnderDest.UF = 'AM') or
                      (Dest.EnderDest.UF = 'PA') or
                      (Dest.EnderDest.UF = 'RO') or
                      (Dest.EnderDest.UF = 'RO') or
                      // Nordeste,
                      (Dest.EnderDest.UF = 'AL') or
                      (Dest.EnderDest.UF = 'BA') or
                      (Dest.EnderDest.UF = 'CE') or
                      (Dest.EnderDest.UF = 'MA') or
                      (Dest.EnderDest.UF = 'PB') or
                      (Dest.EnderDest.UF = 'PE') or
                      (Dest.EnderDest.UF = 'PI') or
                      (Dest.EnderDest.UF = 'RN') or
                      (Dest.EnderDest.UF = 'SE') or
                      // CentroOeste
                      (Dest.EnderDest.UF = 'DF') or
                      (Dest.EnderDest.UF = 'GO') or
                      (Dest.EnderDest.UF = 'MT') or
                      (Dest.EnderDest.UF = 'MS') or
                      // Espírito Santo
                      (Dest.EnderDest.UF = 'ES'))
                      then
                      pICMSInter := 7
                    else
                      pICMSInter := 12;
                  end
                  else
                    //- 4% alíquota interestadual para produtos importados;
                    pICMSInter := 4;
                  ////////////////////////////////////////////////////////////////
                  //5 - Percentual de ICMS Interestadual para a UF de destino
                  if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2016) then
                    pICMSInterPart := 40
                  else if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2017) then
                    pICMSInterPart := 60
                  else if (YearOf(dmNFVenda.cdsNFVendaNFV_DTEMISSAO.AsDateTime) = 2018) then
                    pICMSInterPart := 80
                  else
                    pICMSInterPart := 100;
                  ////////////////////////////////////////////////////////////////
                  //6 - com o valor do FCP ( pFCPUFDest x vBCUFDest )
                  //**************************************************************
                  //Valor do ICMS relativo ao Fundo de Combate à Pobreza (FCP)
                  //da UF de destino.
                  //**************************************************************
                  vFCPUFDest := (vBCUFDest * pFCPUFDest / 100);
                  if vBCUFDest > 0 then
                    vBCFCPUFDest := vBCUFDest;
                  ////////////////////////////////////////////////////////////////
                  //7 - com o valor do FCP + valor do ICMS do DIFAL do destino
                  //destino
                  //**************************************************************
                  //Valor do ICMS Interestadual para a UF de destino, já
                  //considerando o valor do ICMS relativo ao Fundo de Combate
                  //à Pobreza naquela UF.
                  //**************************************************************
                  vICMSUFDest := ((((vBCUFDest * (pICMSUFDest - pICMSInter)) / 100) * pICMSInterPart) / 100);
                  totalVICMSUFDest := totalVICMSUFDest + vICMSUFDest;
                  ////////////////////////////////////////////////////////////////
                  //8 - remetente
                  //**************************************************************
                  //Valor do ICMS Interestadual para a UF do remetente.
                  //Nota: A partir de 2019, este valor será zero.
                  //**************************************************************
                  //((vBCUFDest * (pICMSUFDest - pICMSInter))/100)
                  vICMSUFRemet := ((((vBCUFDest * (pICMSUFDest - pICMSInter)) / 100) * (100 - pICMSInterPart)) / 100);

              (*
                 <vBCUFDest>1000.00</vBCUFDest>
                 <pFCPUFDest>2.00</pFCPUFDest>
                 <pICMSUFDest>17.00</pICMSUFDest>
                 <pICMSInter>12.00</pICMSInter>
                 <pICMSInterPart>40.00</pICMSInterPart>
                 <vFCPUFDest>20.00</vFCPUFDest>
                 <vICMSUFDest>20.00</vICMSUFDest>
                 <vICMSUFRemet>30.00</vICMSUFRemet>
              *)
                end;
              end;

              // -----------------------------------------------------------------
              if (Ide.tpNF = tnSaida) and
                (Dest.EnderDest.UF <> Emit.EnderEmit.UF)
                then
              begin
                if (dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency > 0) and (ICMS.vICMSST > 0) then
                begin
                  ICMS.vBCFCPST := ICMS.vICMSST;
                  ICMS.pFCPST := dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency;
                  ICMS.vFCPST := (ICMS.vBCFCPST * ICMS.pFCPST / 100);
                  vTotalICMSSTFCP := vTotalICMSSTFCP + ICMS.vFCPST;
                end;
                if (dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency > 0) and (ICMS.vBC > 0) then
                begin
                  ICMS.vBCFCP := ICMS.vBC;
                  ICMS.pFCP := dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency;
                  ICMS.vFCP := (ICMS.vBCFCP * ICMS.pFCP / 100);
                  vTotalICMSFCP := vTotalICMSFCP + ICMS.vFCP;
                end;
                if (dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency > 0) and (ICMSUFDest.vBCUFDest > 0) then
                begin
                  ICMSUFDest.vBCFCPUFDest := ICMSUFDest.vBCUFDest;
                  ICMSUFDest.pFCPUFDest := dmNFVenda.cdsNFVendaItemNFVI_FCP_ALIQ.AsCurrency;
                  ICMSUFDest.vFCPUFDest := (ICMSUFDest.vBCFCPUFDest * ICMSUFDest.pFCPUFDest / 100);
                end;
              end;

              vTotalICMSUFFCP := vTotalICMSUFFCP + ICMSUFDest.vFCPUFDest;

              //******************************************************************
              //******************************************************************
            end;
          end;
          dmAcesso.sqlVariant_2.Next;
        end;
      end;

      if (
        (cdsNFVendaNFV_TIPO.AsString = 'S') and
        not (cdsNFVendaCFOP_CLASSIFICACAO.AsString = 'Devolução') and
        (dmConfiguracao.getStr('NF.LEI.IMP') = 'S')
        )
        then
        if ValorTribItemAproximado = 0 then
          ShowMessage('[ Lei De Olho no Imposto (Nº 12.741/2012) ]'#13'O produto: ' + dmNFVenda.cdsNFVendaItemPRO_DESCRICAO.AsString + #13' está com a aliquota zerada, verifique o cadastro de produto, se o NCM está correto!');

      ValorTotalTribAproximado := ValorTotalTribAproximado + ValorTribItemAproximado;
      dmNFVenda.cdsNFVendaItem.Next;
    end;

    if (dmConfiguracao.getStr('NF.ORD.DESCRI') = 'S') then
      dmNFVenda.cdsNFVendaItem.IndexFieldNames := '';
    //
    Transp.modFrete := mfContaEmitente;

    if dmNFVenda.cdsNFVendaNFV_TP_FRETE.AsString = 'FOB' then
    begin
      Total.ICMSTot.vFrete := RoundTo(dmNFVenda.cdsNFVendaNFV_FRETE.AsCurrency, -2);
      Transp.modFrete := mfContaDestinatario;
    end;

    Total.ICMSTot.vBC := RoundTo(dmNFVenda.cdsNFVendaNFV_ICMS_BASE.AsCurrency, -2);
    Total.ICMSTot.vICMS := RoundTo(dmNFVenda.cdsNFVendaNFV_ICMS.AsCurrency, -2);
    if not ((cdsNFVendaCFOP_CLASSIFICACAO.AsString = 'Devolução')
      and
      ((cdsNFVendaCODCFOP.AsString = '5411') or
      (cdsNFVendaCODCFOP.AsString = '6411') or
      (cdsNFVendaCODCFOP.AsString = '5201') or
      (cdsNFVendaCODCFOP.AsString = '5202') or
      (cdsNFVendaCODCFOP.AsString = '6202') or
      (cdsNFVendaCODCFOP.AsString = '6201'))) and (dmAcesso.cdsParGeralPARG_OPCAO_TRIBUTARIA.AsString = 'Simples Nacional') then
    begin
      Total.ICMSTot.vBC := 0;
      Total.ICMSTot.vICMS := 0;
    end;
    Total.ICMSTot.vDesc := RoundTo(dmNFVenda.cdsNFVendaNFV_DESCVLR.AsCurrency + vdescitens, -2);
    Total.ICMSTot.vNF := RoundTo(dmNFVenda.cdsNFVendaNFV_TOTAL_NOTA.AsCurrency, -2);
    Total.ICMSTot.vProd := RoundTo(dmNFVenda.cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency + vdescitens, -2);
    Total.ICMSTot.vOutro := RoundTo(dmNFVenda.cdsNFVendaNFV_ACRESCIMO.AsCurrency, -2);
    Total.ICMSTot.vIPI := RoundTo(dmNFVenda.cdsNFVendaNFV_IPI.AsCurrency, -2);

    Total.ICMSTot.vPIS := vTotalPIS;
    Total.ICMSTot.vCOFINS := vTotalCOFINS;
    Total.ICMSTot.vICMSUFDest := totalVICMSUFDest;

    // -----------------------------------------------------------------
    if (Ide.tpNF = tnSaida) and
      (Dest.EnderDest.UF <> Emit.EnderEmit.UF)
      then
    begin
      if (vTotalICMSSTFCP > 0) then
        Total.ICMSTot.vFCPST := vTotalICMSSTFCP;
      if (vTotalICMSFCP > 0) then
        Total.ICMSTot.vFCP := vTotalICMSFCP;
    end;

    if (vTotalICMSUFFCP > 0) then
      Total.ICMSTot.vFCPUFDest := vTotalICMSUFFCP;

    // Informar a soma no cabeçalho da nota
    if ValorTotalTribAproximado > 0 then
      Total.ICMSTot.vTotTrib := RoundTo(ValorTotalTribAproximado, -2);


    if dmNFVenda.cdsNFVendaNFV_ICMS_SUBST.AsCurrency > 0 then
      Total.ICMSTot.vST := RoundTo(dmNFVenda.cdsNFVendaNFV_ICMS_SUBST.AsCurrency, -2);

    if dmNFVenda.cdsNFVendaNFV_ICMS_SUBST_BASE.AsCurrency > 0 then
      Total.ICMSTot.vBCST := RoundTo(dmNFVenda.cdsNFVendaNFV_ICMS_SUBST_BASE.AsCurrency, -2);

    if dmNFVenda.cdsNFVendaCODTRANSPORTADORA.AsInteger > 0 then
    begin
      Transp.Transporta.CNPJCPF := OnlyNumber(dmNFVenda.cdsNFVendaTRA_CPFCNPJ.AsString);
      if dmNFVenda.cdsNFVendaTRA_RAZAO_SOCIAL.AsString <> '' then
        Transp.Transporta.xNome := dmNFVenda.cdsNFVendaTRA_RAZAO_SOCIAL.AsString
      else
        Transp.Transporta.xNome := dmNFVenda.cdsNFVendaTRA_NOME.AsString;
      Transp.Transporta.IE := OnlyNumber(dmNFVenda.cdsNFVendaTRA_IE.AsString);
      Transp.Transporta.xEnder := dmNFVenda.cdsNFVendaTRA_ENDERECO.AsString;
      Transp.Transporta.xMun := dmNFVenda.cdsNFVendaTRA_CIDADE.AsString;
      Transp.Transporta.UF := dmNFVenda.cdsNFVendaTRA_UF.AsString;
    end;

    if dmNFVenda.cdsNFVendaNFV_PLACA.AsString <> '' then
    begin
      Transp.veicTransp.placa := AnsiReplaceStr(dmNFVenda.cdsNFVendaNFV_PLACA.AsString, '-', '');
      Transp.veicTransp.UF := dmNFVenda.cdsNFVendaNFV_PLACA_UF.AsString;
      //Transp.veicTransp.RNTC
    end;




    //



    if (dmNFVenda.cdsNFVendaNFV_QTD_VOL.AsInteger > 0) or (dmNFVenda.cdsNFVendaNFV_NR_VOL.AsString <> '') then
    begin
      with Transp.Vol.Add do
      begin
        qVol := dmNFVenda.cdsNFVendaNFV_QTD_VOL.AsInteger;
        esp := dmNFVenda.cdsNFVendaNFV_ESP.AsString;
        marca := dmNFVenda.cdsNFVendaNFV_MARCA.AsString;
        pesoB := dmNFVenda.cdsNFVendaNFV_PESO_BRUTO.AsCurrency;
        nVol := dmNFVenda.cdsNFVendaNFV_NR_VOL.AsString;
        pesoL := dmNFVenda.cdsNFVendaNFV_PESO_LIQUIDO.AsCurrency;
      end;
    end;
    //
    obs := '';
    // se for -1 é o padrao
    if (AObsAdd = -1) then
    begin
      if (dmConfiguracao.getStr('NFE.OPT.SMP') = '1') or
        (dmConfiguracao.getStr('NFE.OPT.SMP') = '2') or
        (dmConfiguracao.getStr('NFE.OPT.SMP') = '3')
        then
        AObsAdd := StrToInt(dmConfiguracao.getStr('NFE.OPT.SMP'));
    end;
    // se tiver a escolha da obs
    if (AObsAdd > 0) then
    begin
      if (AObsAdd = 1) or (AObsAdd = 4) or (AObsAdd = 5) then
      begin
        aliq := dmConfiguracao.getCurr('NFE.OPT.ALIQ');
        totalAliq := (aliq * dmNFVenda.cdsNFVendaNFV_TOTAL_NOTA.AsCurrency) / 100;
        //
        obs := '';
        if (AObsAdd = 1) or (AObsAdd = 4) then
          obs := 'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL;';
        if (AObsAdd = 1) then
          obs := obs + 'NÃO GERA DIREITO A CRÉDITO FISCAL DE ISS E DE IPI;';
        //
        obs := obs +
          'PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ ' + FormatCurr(',0.00', totalAliq) + ';' +
          'CORRESPONDENTE À ALÍQUOTA DE ' + FormatCurr(',0.00', aliq) + '%, NOS TERMOS DO ART. 23 DA LC 123/2006';
      end
      else if (AObsAdd = 2) then
        obs := 'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL;' +
          'NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI.'
      else if (AObsAdd = 3) then
        obs := 'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL;' +
          'NÃO GERA DIREITO A CRÉDITO FISCAL DE ICMS E DE ISS.;' +
          'RESOLUÇÃO 10 DO SIMPLES NACIONAL.'
      else if (AObsAdd = 6) then
        obs := 'PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ ' + vlr + ';' +
          'CORRESPONDENTE À ALÍQUOTA DE ' + percent + '%, NOS TERMOS DO ART. 23 DA LC 123/2006';
    end;

    if trim(dmNFVenda.cdsNFVendaNFV_OBS.AsString) = '' then
    begin
      if obs <> '' then
        InfAdic.infCpl := obs;
    end
    else
    begin
      if obs = '' then
        InfAdic.infCpl := trim(dmNFVenda.cdsNFVendaNFV_OBS.AsString)
      else
        InfAdic.infCpl := trim(dmNFVenda.cdsNFVendaNFV_OBS.AsString) + ';' + obs;
    end;

    if dmAcesso.FMD5_ATUAL <> '' then
      if InfAdic.infCpl = '' then
        InfAdic.infCpl := 'MD-5:' + dmAcesso.FMD5_ATUAL
      else
        InfAdic.infCpl := InfAdic.infCpl + ';MD-5:' + dmAcesso.FMD5_ATUAL;

    if ValorTotalTribAproximado > 0 then
      InfAdic.infCpl := InfAdic.infCpl + ';Val Aprox Tributos R$ ' +
        FormatCurr(',0.00', ValorTotalTribAproximado) + ' (' + FormatCurr(',0.00', ((ValorTotalTribAproximado / Total.ICMSTot.vProd) * 100)) + '%) Fonte: IBPT';

    // se for diferente de brasil
    if (dmConfiguracao.getStr('NF.EXT.ATV') = 'S') and
      (Dest.EnderDest.xPais <> 'BRASIL')
      then
    begin
      Dest.CNPJCPF := '';
      // Municipio
      Dest.EnderDest.cMun := 9999999;
      Dest.EnderDest.xMun := 'EXTERIOR';
      //
      Dest.EnderDest.UF := 'EX';
      Dest.EnderDest.Fone := copy(OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE_DDD.ASString) + OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE.ASString), 1, 10);
      Dest.IE := '';
      //
      Exporta.UFembarq := dmNFVenda.cdsNFVendaNFV_UF_EMB.AsString;
      Exporta.xLocEmbarq := dmNFVenda.cdsNFVendaNFV_LOCAL_EMB.AsString;
    end
    else
    begin
      Dest.CNPJCPF := OnlyNumber(dmPessoa.cdsPessoaPES_CPFCNPJ.AsString);
      // Municipio
      try
        Dest.EnderDest.cMun :=
          StrToInt(
          dmNFe.obterCodigoMunicipio(
          dmPessoa.cdsPessoaPES_UF.AsString,
          dmPessoa.cdsPessoaPES_CIDADE.AsString
          )
          );
      except
        on E: Exception do
        begin
          dmAcesso.d2kReator.Funcoes.Win.Error('Erro no Municipio - UF: ' + dmPessoa.cdsPessoaPES_UF.AsString + ' -- Cidade: ' + dmPessoa.cdsPessoaPES_CIDADE.AsString + #13 + 'Verifique Arquivo: ' + 'MunIBGE\MunIBGE-UF' + InttoStr(UFparaCodigo(dmPessoa.cdsPessoaPES_UF.AsString)) + '.txt');
          Exit;
        end;
      end;
      Dest.EnderDest.xMun := dmPessoa.cdsPessoaPES_CIDADE.AsString;
      //
      Dest.EnderDest.UF := dmPessoa.cdsPessoaPES_UF.AsString;
      Dest.EnderDest.Fone := copy(OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE_DDD.ASString) + OnlyNumber(dmPessoa.cdsPessoaPES_TELEFONE.ASString), 1, 10);
      Dest.IE := dmPessoa.cdsPessoaPES_IE.ASString;
    end;
  end;
end;

procedure TdmNFVenda.NFE_Imprimir(CODNFVENDA: Integer; CODSERIE: string; CODPESSOA: Integer; bPDF: Boolean);
var arquivoNFE: string;
  vAux: string;
  iRet, iNFe, iItem: Integer;
  vlr, percent: string;
  sNomeArquivo: string;
  cmd: string;
  sEmailTransp: string;
  transmitir: Boolean;
  memNFE: TStringList;
  email: string;
begin
  memNFE := TStringList.Create;
  // gerar configuracao da NFE
  dmNFVenda.NFE_Cofigure(
    CODNFVENDA,
    CODSERIE,
    CODPESSOA
    );
  if (cdsNFVendaNFV_STATUS.AsString <> 'Faturada') then
    dmAcesso.d2kReator.Funcoes.Win.Error('Você precisa Faturar a NF antes de Transmitir!');
  // se ja tiver recibo
  if (dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString <> '') then
  begin
    if dmConfiguracao.getStr('NFE.2VIA.SENHA') <> '' then
    begin
      if not frmSenha.autorizarSenhaParametro('NFE.2VIA.SENHA', 'Senha da 2via de NF-e') then
        Exit;
    end;

    // verificar se o xml enviado
    if not (dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.IsNull) then
    begin
      dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.SaveToFile(ExtractFilePath(Application.ExeName) + '\' + 'temp-nfe.xml');
      dmNFe.ACBrNFe1.NotasFiscais.Clear;
      dmNFe.ACBrNFe1.NotasFiscais.LoadFromFile(ExtractFilePath(Application.ExeName) + '\' + 'temp-nfe.xml');
      //
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt := dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat := 100;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo := 'Autorizado o uso da NF-e';
      if (dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto = 0) and not (dmNFVenda.cdsNFVendaNFV_NFE_EMISSAO.IsNull) then
        dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := dmNFVenda.cdsNFVendaNFV_NFE_EMISSAO.AsDateTime;
    end // gerar os dados (primeira versao)
    else
    begin
      NFE_GerarDados(-1);
      // colocar o numero do protocolo
      dmNFe.ACBrNFe1.DANFE.Protocolo := dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString;
      //
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt := dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat := 100;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo := 'Autorizado o uso da NF-e';
      if (dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto = 0) and not (dmNFVenda.cdsNFVendaNFV_NFE_EMISSAO.IsNull) then
        dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := dmNFVenda.cdsNFVendaNFV_NFE_EMISSAO.AsDateTime;
    end;

    if (Length(dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) < 10) then
    begin
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID := dmNFVenda.GetChaveAcesso;
   //   dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := ;
    end;


    if bPDF then
    begin
      if (cdsNFVendaPES_EMAIL_NFE.AsString = '') and (cdsNFVendaPES_EMAIL.AsString = '') then
        dmAcesso.d2kReator.Funcoes.Win.Error('A Pessoa informada na NF não tem e-mail cadastrado!');
      //
      sNomeArquivo := StringReplace(dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, 'NFe', '', [rfIgnoreCase]);
      sNomeArquivo := PathWithDelim(dmNFe.ACBrNFe1.DANFE.PathPDF) + sNomeArquivo;

      // colocar o numero do protocolo
      dmNFe.ACBrNFe1.DANFE.Protocolo := cdsNFVendaNFV_NFE_NPROT.AsString;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt := cdsNFVendaNFV_NFE_NPROT.AsString;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat := 100;
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo := 'Autorizado o uso da NF-e';
      if (dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto = 0) then
      begin
        if not (cdsNFVendaNFV_NFE_EMISSAO.IsNull) then
          dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := cdsNFVendaNFV_NFE_EMISSAO.AsDateTime
        else
          dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto := cdsNFVendaNFV_DTEMISSAO.AsDateTime;
      end;

      dmNFe.ACBrNFe1.NotasFiscais.GerarNFe;
      dmNFe.ACBrNFe1.NotasFiscais.GravarXML(sNomeArquivo + '-nfe.xml');

      dmNFe.ACBrNFe1.NotasFiscais.ImprimirPDF;
      if (FilesExists(sNomeArquivo + '-nfe.pdf')) then
        RenameFile(sNomeArquivo + '-nfe.pdf', sNomeArquivo + '.pdf');

      (*
      // salvar arquivos
      dmNFe.ACBrNFe1.NotasFiscais.GravarXml(sNomeArquivo+'.xml');
      dmNFe.ACBrNFe1.NotasFiscais.ImprimirPDF;
      *)

      //
      if (cdsNFVendaPES_EMAIL_NFE.AsString = '') then
        email := cdsNFVendaPES_EMAIL.AsString
      else
        email := cdsNFVendaPES_EMAIL_NFE.AsString;
      //
      sEmailTransp := '';
      //
      if dmNFVenda.cdsNFVendaCODTRANSPORTADORA.AsInteger > 0 then
      begin
        dmAcesso.sqlVariant.Close;
        dmAcesso.sqlVariant.CommandText :=
          ' SELECT ' +
          '   PESSOA.PES_EMAIL ' +
          ' FROM ' +
          '   NFVENDA ' +
          '   INNER JOIN PESSOA ON (NFVENDA.CODTRANSPORTADORA = PESSOA.CODPESSOA) ' +
          ' WHERE CODNFVENDA = ' + cdsNFVendaCODNFVENDA.AsString +
          '   AND CODSERIE   = ' + cdsNFVendaCODSERIE.AsString;
        dmAcesso.sqlVariant.Open;
        if dmAcesso.sqlVariant.FieldByName('PES_EMAIL').AsString <> '' then
          sEmailTransp := ', ' + dmAcesso.sqlVariant.FieldByName('PES_EMAIL').AsString;
      end;
      //

      if not (FileExists(sNomeArquivo + '-NFe.xml')) then
        dmAcesso.d2kReator.Funcoes.Win.Error('Não foi encontrado o arquivo: ' + sNomeArquivo + '-NFe.xml' + #13 + 'XML em: ' + dmNFe.ACBrNFe1.NotasFiscais.Items[0].NomeArq);

      if not (FileExists(sNomeArquivo + '.pdf')) then
        dmAcesso.d2kReator.Funcoes.Win.Error('Não foi encontrado o arquivo: ' + sNomeArquivo + '.pdf');

      if dmConfiguracao.getStr('EMAIL.MAPI') = 'S' then
      begin
        EnviarEMailMapi(
          email,
          'Nf-e ' + cdsNFVendaCODNFVENDA.AsString,
          'Seguem em anexo os arquivos da NF-e.',
          [sNomeArquivo + '-NFe.xml', sNomeArquivo + '.pdf'], true,
          Application.Handle);
      end
      else
      begin
        cmd :=
          ExtractFilePath(Application.ExeName) + 'SSMSendMail.exe ' +
          email + sEmailTransp + '|' +
          'Nf-e ' + cdsNFVendaCODNFVENDA.AsString + '|' +
          sNomeArquivo + '-NFe.xml' + ',' + sNomeArquivo + '.pdf' + '|' +
          'text' + '|' +
          'Seguem em anexo os arquivos da NF-e.';
        CreateProcessSimple(cmd);
      end;

      (*
      EnviarEMail(
        cdsNFVendaPES_EMAIL.AsString,
        'Nf-e ' + cdsNFVendaCODNFVENDA.AsString,
        'Segue em Anexo PDF e XML',
        [sNomeArquivo+'-NFe.xml', sNomeArquivo + '.pdf'],
        Handle);
      *)
    end
    else
    begin
      for iNFe := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Count) do
      begin
        for iItem := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Count) do
        begin
          if dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST > 0 then
            dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Prod.vSeg :=
              dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST;
        end;
      end;
      // imprimir danfe
      dmNFe.ACBrNFe1.NotasFiscais.Imprimir;
      for iNFe := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Count) do
      begin
        for iItem := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Count) do
        begin
          if dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST > 0 then
            dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Prod.vSeg :=
              0;
        end;
      end;
    end;
  end
  else
  begin
    if bPDF then
    begin
      dmAcesso.d2kReator.Funcoes.Win.Error('Nota não foi enviada!!');
      Exit;
    end;

    if (dmConfiguracao.getStr('NFE.OPT.SMP') = '1') or
      (dmConfiguracao.getStr('NFE.OPT.SMP') = '2') or
      (dmConfiguracao.getStr('NFE.OPT.SMP') = '3')
      then
    begin
      try
        frmObsAdd := TfrmObsAdd.Create(Self);
        frmObsAdd.ShowModal;
        vlr := frmObsAdd.edtVlr.Text;
        percent := frmObsAdd.edtPercent.Text;
        iRet := frmObsAdd.retorno;
      finally
        frmObsAdd.Free;
      end;
      NFE_GerarDados(iRet, vlr, percent);
    end
    else
      // gerar nfe
      NFE_GerarDados(0);
    // salvar xml da nfe
    arquivoNFE := ExtractFilePath(Application.ExeName) + 'nfe\' +
      'nfe_serie_' + dmNFVenda.cdsNFVendaCODSERIE.AsString + '_nr_' + dmNFVenda.cdsNFVendaCODNFVENDA.AsString + '_dt_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '_nota.xml';
    dmNFe.ACBrNFe1.NotasFiscais.Items[0].GravarXml(ExtractFileName(arquivoNFE), ExtractFilePath(arquivoNFE));

    for iNFe := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Count) do
    begin
      for iItem := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Count) do
      begin
        if dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST > 0 then
          dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Prod.vSeg :=
            dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST;
      end;
    end;
    // imprimir preview
    dmNFe.ACBrNFe1.NotasFiscais.Imprimir;
    for iNFe := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Count) do
    begin
      for iItem := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Count) do
      begin
        if dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST > 0 then
          dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Prod.vSeg :=
            0;
      end;
    end;


    // transmitir a nota
    if Confirma('Confirma transmitir essa nota?') then
    begin
      try
        // enviar nota
        dmNFe.ACBrNFe1.NotasFiscais.GerarNFe;
        dmNFe.ACBrNFe1.NotasFiscais.Assinar;
        dmNFe.ACBrNFe1.NotasFiscais.Validar;
      except
        on E: Exception do
        begin
          dmAcesso.d2kReator.Funcoes.Win.Error('1 - Erro ao Gerar/Assinar/Validar!'#13'Erro: ' + e.Message);
          Exit;
        end;
      end;
      //
      transmitir := False;
      try
        transmitir := dmNFe.ACBrNFe1.WebServices.Envia(0);
      except
        on E: Exception do
        begin
          if (trim(e.Message) = '') then
          begin
            dmNFe.ACBrNFe1.WebServices.Consulta.NFeChave := dmNFVenda.GetChaveAcesso;
            dmNFe.ACBrNFe1.WebServices.Consulta.Executar;
            //
            if dmNFe.ACBrNFe1.WebServices.Consulta.cStat <> 100 then {se cStat for diferente de 100, e porque foi rejeitada por algum erro }
            begin
              dmAcesso.d2kReator.Funcoes.Win.Error(
                '2.1 - Erro ao Consultar a NF-e!' +
                #13'GetChave: ' + dmNFVenda.GetChaveAcesso +
                #13'tpAmb: ' + TpAmbToStr(dmNFe.ACBrNFe1.WebServices.Consulta.TpAmb) +
                #13'verAplic: ' + dmNFe.ACBrNFe1.WebServices.Consulta.verAplic +
                #13'cStat: ' + IntToStr(dmNFe.ACBrNFe1.WebServices.Consulta.cStat) +
                #13'cUF: ' + IntToStr(dmNFe.ACBrNFe1.WebServices.Consulta.cUF) +
                #13'xMotivo: ' + dmNFe.ACBrNFe1.WebServices.Consulta.xMotivo +
                #13'Protocolo: ' + dmNFe.ACBrNFe1.WebServices.Consulta.Protocolo
                );
              //
              Exit;
            end
            else
            begin
              if (trim(dmNFe.ACBrNFe1.WebServices.Consulta.Protocolo) = '') then
              begin
                dmAcesso.d2kReator.Funcoes.Win.Error('2.2 - Erro ao Consultar a NF-e!'#13'Erro: Não foi encontrado nenhum protocolo de retorno!');
                Exit;
              end
              else
              begin
                dmNFVenda.cdsNFVenda.Edit;
                dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.LoadFromFile(arquivoNFE);
                dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString := dmNFe.ACBrNFe1.WebServices.Consulta.Protocolo;
                dmNFVenda.cdsNFVendaNFV_NFE_EMISSAO.AsDateTime := dmNFe.ACBrNFe1.WebServices.Consulta.DhRecbto;
                //dmNFVenda.cdsNFVendaNFV_NFE_NREC.AsString    := dmNFe.ACBrNFe1.WebServices.Consulta.protNFe.;
                dmNFVenda.cdsNFVenda.Post;
                dmNFVenda.cdsNFVenda.ApplyUpdates(0);
                // colocar o numero do protocolo
                dmNFe.ACBrNFe1.DANFE.Protocolo := dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString;
                dmNFe.ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt := dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString;
                // imprimir danfe
                dmNFe.ACBrNFe1.NotasFiscais.Imprimir;
                // ok
                ShowMessage('NF-e enviada com sucesso!');
                Exit;
              end;
            end;
          end
          else
          begin
            dmAcesso.d2kReator.Funcoes.Win.Error('2 - Erro ao Enviar a NF-e via WEBSERVICE!'#13'Erro: ' + e.Message);
            Exit;
          end;
        end;
      end;
      //
      try
        if transmitir then
        begin
          // salvar
          memNFE.Clear;
          memNFE.Text := UTF8Encode(dmNFe.ACBrNFe1.WebServices.Retorno.RetWS);
          memNFE.SaveToFile(AnsiReplaceStr(arquivoNFE, '_nota.xml', '_retorno.xml'));

          // se tiver protocolo de entrega
          if dmNFe.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].nProt <> '' then
          begin
            dmNFVenda.cdsNFVenda.Edit;
            dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.LoadFromFile(arquivoNFE);
            dmNFVenda.cdsNFVendaNFV_XML_RETORNO.LoadFromFile(AnsiReplaceStr(arquivoNFE, '_nota.xml', '_retorno.xml'));
            dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString := dmNFe.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].nProt;
            dmNFVenda.cdsNFVendaNFV_NFE_EMISSAO.AsDateTime := dmNFe.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].dhRecbto;
            dmNFVenda.cdsNFVendaNFV_NFE_NREC.AsString := dmNFe.ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec;
            dmNFVenda.cdsNFVenda.Post;
            dmNFVenda.cdsNFVenda.ApplyUpdates(0);

            for iNFe := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Count) do
            begin
              for iItem := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Count) do
              begin
                if dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST > 0 then
                  dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Prod.vSeg :=
                    dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST;
              end;
            end;
            // imprimir danfe
            dmNFe.ACBrNFe1.NotasFiscais.Imprimir;
            for iNFe := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Count) do
            begin
              for iItem := 0 to pred(dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Count) do
              begin
                if dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Imposto.ICMS.vICMSST > 0 then
                  dmNFe.ACBrNFe1.NotasFiscais.Items[iNFe].NFe.Det.Items[iItem].Prod.vSeg :=
                    0;
              end;
            end;
            // ok
            ShowMessage('NF-e enviada com sucesso!');
          end
          else
            ShowMessage('Não foi encontrado nenhum protocolo de retorno!');
        end
        else
          ShowMessage('Não foi possivel enviar a NF-e!');
      except
        on E: Exception do
        begin
          dmAcesso.d2kReator.Funcoes.Win.Error('3 - Erro ao tratar o RETORNO do WEBSERVICE!'#13'Erro: ' + e.Message);
          Exit;
        end;
      end;
    end
    else
      Exit;
  end;

{


  // se ja tiver recibo
  if (dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString <> '') then
  begin
      if not(dmAcesso.d2kReator.Funcoes.Win.Confirma('Nota Fiscal ja enviada, deseja gerar o DANFe?', false)) then
        Exit;

    if (dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.IsNull) then
    begin
      // gerar configuracao da NFE
      NFE_GerarDados;
      arquivo := ExtractFilePath(Application.ExeName) + 'nfe.xml';
      dmNFe.ACBrNFe1.NotasFiscais.Items[0].SaveToFile(arquivo);
      dmNFe.ACBrNFe1.NotasFiscais.Clear;
      dmNFe.ACBrNFe1.NotasFiscais.LoadFromFile(arquivo);
      dmNFe.ACBrNFe1.DANFE.ProtocoloNFe := dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString;
      dmNFe.ACBrNFe1.NotasFiscais.Imprimir;
    end
    else
    begin
      dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.SaveToFile('xml-nfe.xml');
      dmNFe.ACBrNFe1.NotasFiscais.LoadFromFile('xml-nfe.xml');
    end;
    dmNFe.ACBrNFe1.NotasFiscais.Imprimir;
    Exit;


  if not(dmAcesso.d2kReator.Funcoes.Win.Confirma('Confirma Gerar e Enviar a NFe?', False)) then
    exit;
  //
  NFE_GerarDados;


  dmNFe.ACBrNFe1.Enviar(0);
  arquivo := ExtractFilePath(Application.ExeName) + 'nfe.xml';
  dmNFe.ACBrNFe1.NotasFiscais.Items[0].SaveToFile(arquivo);
  CopyFile(PChar(Arquivo), PChar(ExtractFilePath(Application.ExeName) + 'nfe\' + ExtractFileName(Arquivo)), false);
  //
  dmNFVenda.cdsNFVenda.Edit;
  dmNFVenda.cdsNFVendaNFV_XML_ENVIADO.LoadFromFile(Arquivo);
  dmNFVenda.cdsNFVendaNFV_XML_RETORNO.AsString := UTF8Encode(dmNFe.ACBrNFe1.WebServices.Retorno.RetWS);
  dmNFVenda.cdsNFVendaNFV_NFE_NPROT.AsString   := dmNFe.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt;
  dmNFVenda.cdsNFVendaNFV_NFE_NREC.AsString    := dmNFe.ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec;
  dmNFVenda.cdsNFVenda.Post;
  dmNFVenda.cdsNFVenda.ApplyUpdates(0);
  //
  dmNFe.ACBrNFe1.NotasFiscais.ImprimirPDF;
  dmNFe.ACBrNFe1.NotasFiscais.Clear;
  //
  DeleteFile(Arquivo);
  ShowMessage('Enviado com sucesso!!');
}
end;

procedure TdmNFVenda.NFVENDAITEM_CalcularTotal;
begin
  NFVENDA_CALC_DESC_PERC(True);

  cdsNFVendaItemNFVI_TOTAL.AsCurrency :=
    NFVENDAITEM_TotalItem -
    cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency;

  NFVENDAITEM_CalcularTotal_IPIICMS;
end;

procedure TdmNFVenda.NFVENDAITEM_CalcularTotal_IPIICMS;
begin
  // calcular icms
  cdsNFVendaItemNFVI_ICMS.AsCurrency :=
    (
    (cdsNFVendaItemNFVI_ICMS_BASE.AsCurrency - cdsNFVendaItemNFVI_VLRDESC.AsCurrency)
    * cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency
    ) / 100;

  cdsNFVendaItemNFVI_PIS_VLR.AsCurrency :=
    (
    cdsNFVendaItemNFVI_PIS_BC.AsCurrency * cdsNFVendaItemNFVI_PIS_PER.AsCurrency
    ) / 100;

  cdsNFVendaItemNFVI_COFINS_VLR.AsCurrency :=
    (
    cdsNFVendaItemNFVI_COFINS_BC.AsCurrency * cdsNFVendaItemNFVI_COFINS_PER.AsCurrency
    ) / 100;

  if not (cdsNFVendaItemNFVI_ALTERAR_IPI.AsString = 'S') then
    // calcular ipi
    cdsNFVendaItemNFVI_IPI.AsCurrency :=
      (NFVENDAITEM_TotalItem * cdsNFVendaItemNFVI_ALIQ_IPI.AsCurrency) / 100;
end;

procedure TdmNFVenda.NFVendaItem_CalculaUnidade;
begin
  if cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Produto' then
  begin
    try
      cdsNFVendaItemNFVI_VLR_UND.AsCurrency :=
        cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency * sdsUndProdutoQTDE.AsCurrency;
    except
      cdsNFVendaItemNFVI_VLR_UND.AsCurrency := cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency;
    end;
  end
  else if cdsNFVendaItemNFVI_CATEGORIA.AsString = 'Serviço' then
    cdsNFVendaItemNFVI_VLR_UND.AsCurrency := cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency;
end;

function TdmNFVenda.NFVENDAITEM_TotalItem: Currency;
begin
  result := cdsNFVendaItemNFVI_QTDE.AsCurrency * cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency;
end;

procedure TdmNFVenda.NFVENDA_CalcularTotal;
var
  pCur: Currency;
  pIntX: Integer;
  pCurIPI, pCurICMS: Currency;
  pCurIPI_BASE, pCurICMS_BASE: Currency;

  pCurICMS_SUBST_BASE, pCurICMS_SUBST: Currency;

  pCurALIQ_ICMS: Currency;
  pCurAliqAgregado, pCurVlrAgregado: Currency;
  pCurTotalSubtsItem: Currency;
begin
  pCur := 0;
  pCurICMS := 0;
  pCurICMS_BASE := 0;
  pCurIPI := 0;
  pCurIPI_BASE := 0;
  pCurALIQ_ICMS := 0;
  pCurICMS_SUBST_BASE := 0;
  pCurICMS_SUBST := 0;

  if (cdsNFVendaItem.State in [dsEdit, dsInsert]) or (cdsNFVendaServico.State in [dsEdit, dsInsert]) then
    Exit;

  if cdsNFVenda.State in [dsEdit, dsInsert] then
  begin
    // iss
    cdsNFVendaNFV_ISS_BASE.AsCurrency := 0;
    cdsNFVendaNFV_ISS.AsCurrency := 0;
    cdsNFVendaNFV_ICMS_SUBST_BASE.AsCurrency := 0;
    cdsNFVendaNFV_ICMS_SUBST.AsCurrency := 0;

    // icms
    if not (cdsNFVendaNFV_ALTERAR_BASE_ICMS.AsString = 'S') then
    begin
      cdsNFVendaNFV_ICMS_BASE.AsCurrency := 0;
      cdsNFVendaNFV_ICMS.AsCurrency := 0;
    end;

    // servicos
    if not (cdsNFVendaServico.IsEmpty) then
    begin
      pCur := 0;
      with cdsNFVendaServico do
      begin
        pIntX := RecNo;
        First;
        DisableControls;
        while not (Eof) do
        begin
          pCur := pCur + FieldByName('NFVS_TOTAL').AsCurrency;
          Next;
        end;
        RecNo := pIntX;
        EnableControls;
      end;
      // ISS
      cdsNFVendaNFV_ISS_BASE.AsCurrency := pCur;
      cdsNFVendaNFV_ISS.AsCurrency := (cdsNFVendaNFV_ISS_BASE.AsCurrency * cdsNFVendaNFV_ISS_ALIQ.AsCurrency) / 100;
    end;

    // produtos
    if not (cdsNFVendaItem.IsEmpty) then
    begin
      pCur := 0;
      pCurICMS := 0;
      pCurICMS_BASE := 0;
      pCurIPI := 0;
      pCurIPI_BASE := 0;
      pCurTotalSubtsItem := 0;
      with cdsNFVendaItem do
      begin
        pIntX := RecNo;
        DisableControls;

        First;
        while not (Eof) do
        begin
          pCur := pCur + FieldByName('NFVI_TOTAL').AsCurrency;

          // ICMS
          // SÓ PODE SOMAR SE TIVER ICMS INFORMADO
          if FieldByName('NFVI_ICMS').AsCurrency > 0 then
          begin
            pCurICMS := pCurICMS + FieldByName('NFVI_ICMS').AsCurrency;
            pCurICMS_BASE := pCurICMS_BASE + FieldByName('NFVI_ICMS_BASE').AsCurrency;
            pCurALIQ_ICMS := FieldByName('NFVI_ALIQ_ICMS').AsCurrency;
          end;

          // ST
          pCurICMS_SUBST := pCurICMS_SUBST + FieldByName('NFVI_SUBST_VLR').AsCurrency;
          pCurICMS_SUBST_BASE := pCurICMS_SUBST_BASE + FieldByName('NFVI_SUBST_BC').AsCurrency;

{$IFDEF APOLO}
          if cdsNFVendaItemPRO_REG_ICMS.asstring = 'S' then
          begin
            pCurAliqAgregado := 0;
            pCurVlrAgregado := 0;

            if cdsNFVendaItemPRO_TIPOLISTA.AsString = '1' then
            begin
              if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 7 then
                pCurAliqAgregado := 54.89
              else if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 12 then
                pCurAliqAgregado := 46.56
              else if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 17 then
                pCurAliqAgregado := 38.24;
            end
            else
              if cdsNFVendaItemPRO_TIPOLISTA.AsString = '2' then
              begin
                if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 7 then
                  pCurAliqAgregado := 58.37
                else if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 12 then
                  pCurAliqAgregado := 49.86
                else if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 17 then
                  pCurAliqAgregado := 41.34;
              end
              else
                if cdsNFVendaItemPRO_TIPOLISTA.AsString = '3' then
                begin
                  if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 7 then
                    pCurAliqAgregado := 49.08
                  else if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 12 then
                    pCurAliqAgregado := 41.06
                  else if cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency = 17 then
                    pCurAliqAgregado := 33.05;
                end;

            if pCurAliqAgregado > 0 then
            begin
              pCurVlrAgregado := cdsNFVendaItemNFVI_TOTAL.AsCurrency + (pCurAliqAgregado * cdsNFVendaItemNFVI_TOTAL.AsCurrency) / 100;
              pCurTotalSubtsItem := (cdsNFVendaItemNFVI_ALIQ_ICMS.AsCurrency * pCurVlrAgregado) / 100;
              pCurTotalSubtsItem := pCurTotalSubtsItem - cdsNFVendaItemNFVI_ICMS.AsCurrency;
              pCurICMS_SUBST := pCurICMS_SUBST + pCurTotalSubtsItem;
              pCurICMS_SUBST_BASE := pCurICMS_SUBST_BASE + pCurVlrAgregado;
            end;
          end;
{$ENDIF}

          // IPI
          if FieldByName('NFVI_IPI').AsCurrency > 0 then
          begin
            //pCurIPI := pCurIPI + StrToCurr(AnsiReplaceStr(cdsNFVendaItemNFVI_IPI.DisplayText, '.', ''));
            pCurIPI := pCurIPI + cdsNFVendaItemNFVI_IPI.AsCurrency;
            pCurIPI_BASE := pCurIPI_BASE + NFVENDAITEM_TotalItem;
          end;

          Next;
        end;
        RecNo := pIntX;
        EnableControls;
      end;

      // ICMS
      if not (cdsNFVendaNFV_ALTERAR_BASE_ICMS.AsString = 'S') then
      begin
        cdsNFVendaNFV_ICMS_BASE.AsCurrency := pCurICMS_BASE;
        cdsNFVendaNFV_ICMS.AsCurrency := pCurICMS;
      end
      else
        cdsNFVendaNFV_ICMS.AsCurrency := (cdsNFVendaNFV_ICMS_BASE.AsCurrency * pCurALIQ_ICMS) / 100;

      // IPI
      cdsNFVendaNFV_IPI.AsCurrency := pCurIPI;
    end;
{$IFDEF APOLO}
    if dmNfVenda.cdsNFVendaPES_CONSUMIDOR_FINAL.AsString = 'X' then
    begin
      cdsNFVendaNFV_ICMS_SUBST_BASE.AsCurrency := RoundUp(pCurICMS_SUBST_BASE, -2);
      cdsNFVendaNFV_ICMS_SUBST.AsCurrency := RoundUp(pCurICMS_SUBST, -2);
    end;
{$ELSE}
    cdsNFVendaNFV_ICMS_SUBST_BASE.AsCurrency := RoundUp(pCurICMS_SUBST_BASE, -2);
    cdsNFVendaNFV_ICMS_SUBST.AsCurrency := RoundUp(pCurICMS_SUBST, -2);
{$ENDIF}
    // calcular o iss
    cdsNFVendaNFV_ISS.AsCurrency := (cdsNFVendaNFV_ISS_ALIQ.AsCurrency * pCur) / 100;
    // IR
    cdsNFVendaNFV_IR_VLR.AsCurrency := (cdsNFVendaNFV_IR_PERC.AsCurrency * pCur) / 100;
    // Total de produtos
    cdsNFVendaNFV_TOTAL_PRODUTOS.AsCurrency := pCur;
    // total da nota
    cdsNFVendaNFV_TOTAL_NOTA.AsCurrency :=
      pCur +
      cdsNFVendaNFV_IPI.AsCurrency +
      cdsNFVendaNFV_ACRESCIMO.AsCurrency +
      cdsNFVendaNFV_ICMS_SUBST.AsCurrency -
      cdsNFVendaNFV_IR_VLR.AsCurrency -
      cdsNFVendaNFV_DESCVLR.AsCurrency;
    // verificar se soma ou nao o frete
    // cif - nao soma no total
    // fob - soma no total
    if cdsNFVendaNFV_TP_FRETE.AsString = 'FOB' then
      cdsNFVendaNFV_TOTAL_NOTA.AsCurrency :=
        cdsNFVendaNFV_TOTAL_NOTA.AsCurrency + cdsNFVendaNFV_FRETE.AsCurrency;
  end;
end;

procedure TdmNFVenda.NFVENDA_CALC_DESC_PERC(Verificar: Boolean = False);
  procedure calc_total;
  begin
    cdsNFVendaItemNFVI_TOTAL_DESCONTO.AsCurrency :=
      (cdsNFVendaItemNFVI_PERDESC.AsCurrency *
      (cdsNFVendaItemNFVI_QTDE.AsCurrency * cdsNFVendaItemNFVI_VLR_UNITARIO.AsCurrency)
      )
      / 100;
  end;
begin
  if Verificar then
  begin
    if cdsNFVendaItemNFVI_PERDESC.AsCurrency > 0 then
      calc_total;
  end
  else
    calc_total;
end;

function TdmNFVenda.NFVENDA_Faturar: Boolean;
  function Faturar(AFin: string): Boolean;
  var
    vSql: string;
    sqlUpdate, sql_caixa: string;
    CODCAIXAABERTURA: Integer;
  begin
    CODCAIXAABERTURA := dmCaixaAbertura.verificarCaixaAberto;
    if CODCAIXAABERTURA > 0 then
      sql_caixa := ', CODCAIXAABERTURA = ' + IntToStr(CODCAIXAABERTURA);

    // atualizar estoque
    vSql := 'execute procedure STP_NFVENDA_FATURA(';
    vSql := vSql + cdsNFVendaCODNFVENDA.AsString + ', ';
    vSql := vSql + QuotedStr(cdsNFVendaCODSERIE.AsString) + ', ';
    vSql := vSql + QuotedStr(AFin) + ', ';
    vSql := vSql + QuotedStr(cdsNFVendaNFV_BAIXA_ESTOQUE.AsString) + ', ';
    if dmAcesso.TRABALHA_COM_LOTE then
      vSql := vSql + QuotedStr('S')
    else
      vSql := vSql + QuotedStr('N');
    vSql := vSql + ')';
    ////////////////////////////////////////////////////////////////////////////
    sqlUpdate :=
      'UPDATE NFVENDA SET ' +
      '   NFV_DATA_FATURAMENTO = ' + QuotedStr(
      AnsiReplaceStr(
      DateTimeToStr(
      dmCaixaAbertura.getDataAbertura
      ), '/', '.')) +
      ' , NFV_USUARIO_FATURAMENTO = ' + QuotedStr(dmAcesso.d2kReator.UsuarioLogado) +
      sql_caixa +
      ' WHERE CODNFVENDA = ' + cdsNFVendaCODNFVENDA.AsString +
      '   AND CODSERIE = ' + QuotedStr(cdsNFVendaCODSERIE.AsString);
    dmAcesso.executeSQL(sqlUpdate);
    ////////////////////////////////////////////////////////////////////////////
    if cdsNFVenda.State = dsInsert then
    begin
      cdsNFVenda.Post;
      cdsNFVenda.ApplyUpdates(0);
      cdsNFVenda.Edit;
    end;

    if cdsNFVendaItem.ChangeCount > 0 then
      cdsNFVendaItem.ApplyUpdates(0);

    try
      dmAcesso.executeSQL_2(vSql);
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao faturar a NF. Erro: ' + e.Message);
        Exit;
      end;
    end;
    Result := True;
    ShowMessage('Faturada com sucesso!');
  end;
var
  cTotalPago, cTotalNota, cTotalNovoNFCompra: Currency;
begin
  Result := False;
  //
  if dmAcesso.d2kReator.Funcoes.Win.Confirma('Confirma Faturar essa Nota Fiscal?') then
  begin
    if not (dmNFVenda.cdsNFVendaNFV_FINALIDADE_EMISSAO.AsString = '2') and
      (dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsInteger > 0)
      then
    begin
      dmAcesso.sqlVariant_3.Close;
      dmAcesso.sqlVariant_3.CommandText :=
        ' SELECT SUM(COALESCE(CONTAS.con_vlrparcela, 0)) AS PARCELA, SUM(COALESCE(CONTAS.con_vlrpago, 0)) AS PAGO FROM CONTAS ' +
        ' WHERE CODNFVENDA = ' + dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsString +
        ' AND CODSERIE = ' + QuotedStr(dmNFVenda.cdsNFVendaCODSERIE_DEV.AsString);
      dmAcesso.sqlVariant_3.Open;

      if dmAcesso.sqlVariant_3.FieldByName('PARCELA').AsCurrency > 0 then
      begin
        if (dmAcesso.sqlVariant_3.FieldByName('PAGO').AsCurrency > 0) then
          dmAcesso.d2kReator.Funcoes.Win.Error('A Nf. Ref. tem o financeiro com baixa!! Você precisa excluir essa baixa para depois de refazer o financeiro, você baixar!');

        if (RoundTo(cdsNFVendaNFV_TOTAL_NOTA.AsCurrency, -2) > RoundTo(dmAcesso.sqlVariant_3.FieldByName('PARCELA').AsCurrency, -2)) then
          dmAcesso.d2kReator.Funcoes.Win.Error('A NF-e tem o valor maior que NF. Ref. e por isso não é possivel fazer essa operação!')
        else
        begin
          if (RoundTo(cdsNFVendaNFV_TOTAL_NOTA.AsCurrency, -2) < RoundTo(dmAcesso.sqlVariant_3.FieldByName('PARCELA').AsCurrency, -2)) then
          begin
            dmAcesso.d2kReator.Funcoes.Win.Alerta('A Nf. Ref. tem um valor maior e por isso precisa ser refeito o financeiro com essa diferença!'#13'Por favor refaça o financeiro na proxima tela!');
            dmAcesso.sqlVariant.Close;
            dmAcesso.sqlVariant.CommandText :=
              'select CODFORMAPAGAMENTO from nfvenda where codnfvenda = ' + dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsString
              + ' and codserie = ' + dmNFVenda.cdsNFVendaCODSERIE_DEV.AsString;
            dmAcesso.sqlVariant.Open;
            //
            dmFormaDePagamento.cdsFormaDePagamento.Close;
            dmFormaDePagamento.cdsFormaDePagamento.Params.ParamByName('CODFORMAPAGAMENTO').AsInteger :=
              dmAcesso.sqlVariant.FieldByName('CODFORMAPAGAMENTO').AsInteger;
            dmFormaDePagamento.cdsFormaDePagamento.Open;
            //
            if not frmContasFechamento.GerarContas(
              cdsNFVendaNFV_DTEMISSAO.AsDateTime,
              RoundTo(dmAcesso.sqlVariant_3.FieldByName('PARCELA').AsCurrency, -2) - RoundTo(cdsNFVendaNFV_TOTAL_NOTA.AsCurrency, -2),
              dmFormaDePagamento.cdsFormaDePagamentoFPG_PARCELAS.AsInteger,
              dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS.AsInteger,
              dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS_DEMAIS.AsInteger,
              cdsNFVendaCODPESSOA.AsInteger,
              dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsInteger,
              dmNFVenda.cdsNFVendaCODSERIE_DEV.AsString, 0,
              0, 'S',
              0, 0,
              0, '',
              dmFormaDePagamento.cdsFormaDePagamentoCODMOEDA.AsInteger,
              '1/1/2008', 0, False, 0, '', 0, '', '', 0, 0, 0, 0, 0, 'N', '', False, nil, 0, 0, 0, 0, False, '', False,
              False)
              then
              dmAcesso.d2kReator.Funcoes.Win.Error('A Nf. Ref. precisa ser refaturada!')
          end
          else
          begin
            dmAcesso.executeSQL(
              ' UPDATE CONTAS SET CON_STATUS = ' + QuotedStr('EXCLUÍDA') +
              ' WHERE CODNFVENDA = ' + dmNFVenda.cdsNFVendaCODNFVENDA_DEV.AsString +
              ' AND CODSERIE = ' + QuotedStr(dmNFVenda.cdsNFVendaCODSERIE_DEV.AsString)
              );
          end;
        end;
      end;
    end;


    //


    if (dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsInteger > 0) then
    begin
      dmAcesso.sqlVariant_3.Close;
      dmAcesso.sqlVariant_3.CommandText :=
        ' SELECT SUM(COALESCE(CONTAS.con_vlrpago, 0)) AS PAGO FROM CONTAS ' +
        ' WHERE CODNFCOMPRA = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString +
        ' AND CODPESSOA = ' + dmNFVenda.cdsNFVendaCODPESSOA.ASString;
      dmAcesso.sqlVariant_3.Open;
      cTotalPago := dmAcesso.sqlVariant_3.FieldByName('PAGO').AsCurrency;
      //////////////////////////////////////////////////////////////////////////
      dmAcesso.sqlVariant_3.Close;
      dmAcesso.sqlVariant_3.CommandText :=
        ' SELECT nfcompra.nfc_total_nota from nfcompra ' +
        ' WHERE CODNFCOMPRA = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString;
      dmAcesso.sqlVariant_3.Open;
      cTotalNota := dmAcesso.sqlVariant_3.FieldByName('nfc_total_nota').AsCurrency;
      //////////////////////////////////////////////////////////////////////////
      if (RoundTo(cdsNFVendaNFV_TOTAL_NOTA.AsCurrency, -2) > RoundTo(cTotalNota, -2)) then
        dmAcesso.d2kReator.Funcoes.Win.Error('A NF-e tem o valor maior que nota de compra e por isso não é possivel fazer essa operação!')
      else
      begin
        if (cTotalPago > 0) then
        begin
          dmAcesso.sqlVariant_3.Close;
          dmAcesso.sqlVariant_3.CommandText :=
            ' SELECT distinct CONTAS_BAIXAS.CODBANCO FROM CONTAS_BAIXAS WHERE CONTAS_BAIXAS.CODCONTA ' +
            ' IN (SELECT CONTAS.CODCONTA FROM CONTAS WHERE CONTAS.CODNFCOMPRA = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString +
            ' AND CODPESSOA = ' + dmNFVenda.cdsNFVendaCODPESSOA.ASString + ')';
          dmAcesso.sqlVariant_3.Open;
          //
          dmAcesso.storedVariant.StoredProcName := 'STP_NTCREDITO_ADD';
          dmAcesso.storedVariant.ParamByName('CODPESSOA').AsInteger := dmNFVenda.cdsNFVendaCODPESSOA.AsInteger;
          dmAcesso.storedVariant.ParamByName('NTC_TIPO').AsString := 'PAG';
          dmAcesso.storedVariant.ParamByName('VALOR').AsCurrency := cTotalPago;
          dmAcesso.storedVariant.ParamByName('CODBANCO').AsInteger := dmAcesso.sqlVariant_3.FieldByName('CODBANCO').AsInteger;
          dmAcesso.storedVariant.ParamByName('NTC_USUARIO').AsString := dmAcesso.d2kReator.UsuarioLogado;
          dmAcesso.storedVariant.ExecProc;
          //
          dmAcesso.executeSQL(
            ' DELETE FROM CONTAS_BAIXAS WHERE CONTAS_BAIXAS.CODCONTA ' +
            ' IN (SELECT CONTAS.CODCONTA FROM CONTAS WHERE CONTAS.CODNFCOMPRA = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString +
            ' AND CODPESSOA = ' + dmNFVenda.cdsNFVendaCODPESSOA.ASString + ')'
            );
        end;
        // ---------------------------------------------------------------------
        // apagar o financeiro da nf de compra
        dmAcesso.executeSQL(
          ' UPDATE CONTAS ' +
          '    SET CON_STATUS = ' + QuotedStr('EXCLUÍDA') +
          '  WHERE CODNFCOMPRA = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString
          );
        // ---------------------------------------------------------------------
        cTotalNovoNFCompra := cTotalNota - RoundTo(cdsNFVendaNFV_TOTAL_NOTA.AsCurrency, -2);
        // ---------------------------------------------------------------------
        if (cTotalNovoNFCompra > 0) then
        begin
          //////////////////////////////////////////////////////////////////////////
          dmAcesso.d2kReator.Funcoes.Win.Alerta('O Financeiro da "NF. Compra" precisa ser refeito antes de faturar a "NF-e".'#13'Vlr. Adiantamento = ' + FormatCurr(',0.00', cTotalPago));
          //////////////////////////////////////////////////////////////////////////
          dmAcesso.sqlVariant.Close;
          dmAcesso.sqlVariant.CommandText :=
            'select CODFORMAPAGAMENTO from nfcompra where codnfcompra = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString;
          dmAcesso.sqlVariant.Open;
          //////////////////////////////////////////////////////////////////////////
          dmFormaDePagamento.cdsFormaDePagamento.Close;
          dmFormaDePagamento.cdsFormaDePagamento.Params.ParamByName('CODFORMAPAGAMENTO').AsInteger :=
            dmAcesso.sqlVariant.FieldByName('CODFORMAPAGAMENTO').AsInteger;
          dmFormaDePagamento.cdsFormaDePagamento.Open;
          //////////////////////////////////////////////////////////////////////////
          dmAcesso.sqlVariant_3.Close;
          dmAcesso.sqlVariant_3.CommandText :=
            ' SELECT NFC_DATA_EMI, NFC_TOTAL_NOTA, CODPESSOA, CODNFCOMPRA, NFC_NRNOTA, CODCENTCUSTO from nfcompra ' +
            ' WHERE CODNFCOMPRA = ' + dmNFVenda.cdsNFVendaCODNFCOMPRA_DEV.AsString;
          dmAcesso.sqlVariant_3.Open;
          //////////////////////////////////////////////////////////////////////////
          if not frmContasFechamento.GerarContas(
            dmAcesso.sqlVariant_3.FieldByName('NFC_DATA_EMI').AsDateTime,
            cTotalNovoNFCompra,
            dmFormaDePagamento.cdsFormaDePagamentoFPG_PARCELAS.AsInteger,
            dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS.AsInteger,
            dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS_DEMAIS.AsInteger,
            dmAcesso.sqlVariant_3.FieldByName('CODPESSOA').AsInteger, 0, '',
            dmAcesso.sqlVariant_3.FieldByName('CODNFCOMPRA').AsInteger,
            dmAcesso.sqlVariant_3.FieldByName('NFC_NRNOTA').AsInteger,
            'S', 0, 0, 0, '',
            dmFormaDePagamento.cdsFormaDePagamentoCODMOEDA.AsInteger, '1/1/2008',
            dmAcesso.sqlVariant_3.FieldByName('CODCENTCUSTO').AsInteger)
            then
            dmAcesso.d2kReator.Funcoes.Win.Error('A nota de compra precisa ser refaturada, antes de continuar!');
        end
        else
          dmAcesso.d2kReator.Funcoes.Win.Alerta('O Financeiro da "NF. Compra" apos a devolução ficou zerado!'#13'Vlr. Adiantamento = ' + FormatCurr(',0.00', cTotalPago));
      end;
    end;



    dmCfop.cdsCfop.Close;
    dmCfop.cdsCfop.Params[0].AsString := cdsNFVendaCODCFOP.AsString;
    dmCfop.cdsCfop.Open;
    // verificar se gera financeiro
    if dmCfop.cdsCfopCFOP_GERAFINANCEIRO.AsString = 'S' then
    begin
      dmFormaDePagamento.cdsFormaDePagamento.Close;
      dmFormaDePagamento.cdsFormaDePagamento.Params.ParamByName('CODFORMAPAGAMENTO').AsInteger :=
        cdsNFVendaCODFORMAPAGAMENTO.AsInteger;
      dmFormaDePagamento.cdsFormaDePagamento.Open;
      //
      if frmContasFechamento.GerarContas(
        cdsNFVendaNFV_DTEMISSAO.AsDateTime, cdsNFVendaNFV_TOTAL_NOTA.AsCurrency,
        dmFormaDePagamento.cdsFormaDePagamentoFPG_PARCELAS.AsInteger, dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS.AsInteger,
        dmFormaDePagamento.cdsFormaDePagamentoFPG_NUMDIAS_DEMAIS.AsInteger, cdsNFVendaCODPESSOA.AsInteger, cdsNFVendaCODNFVENDA.AsInteger,
        cdsNFVendaCODSERIE.AsString, 0,
        0, 'N',
        0, 0,
        0, '',
        dmFormaDePagamento.cdsFormaDePagamentoCODMOEDA.AsInteger)
        then
        Result := Faturar('S');
    end
    else
      Result := Faturar('N');
  end;
end;

function TdmNFVenda.NFVENDA_Faturar_Pergunta(ACODNFVENDA: Integer; ACODSERIE: string; pTipo: string; AReabrirRegistro: Boolean = True): Boolean;
begin
  Result := False;
  //
  if (dmConfiguracao.getStr('NF.FAT.S/EST') = 'N')
    and temProdutoSemEstoque(ACODNFVENDA, ACODSERIE, pTipo, AReabrirRegistro)
    then
    dmAcesso.d2kReator.Funcoes.Win.Error('Há produtos sem Estoque. Esta função não está autorizada.');
  //
{$IFDEF DEMO}
  dmAcesso.VersaoDemo;
  Abort;
{$ENDIF}
  //
  if AReabrirRegistro then
  begin
    dmNFVenda.cdsNFVenda.Close;
    dmNFVenda.cdsNFVenda.Params.ParamByName('CODNFVENDA').AsInteger := ACODNFVENDA;
    dmNFVenda.cdsNFVenda.Params.ParamByName('CODSERIE').AsString := ACODSERIE;
    dmNFVenda.cdsNFVenda.Open;
  end;
  //
{$IFDEF MEDUSA}
{$ELSE}
  if (dmNFVenda.cdsNFVendaCODFORMAPAGAMENTO.AsInteger = 0) or
    (dmNFVenda.cdsNFVendaCODFORMAPAGAMENTO.AsInteger = 99)
    then
  begin
    dmAcesso.d2kReator.Funcoes.Win.Error('Sem forma de pagamento!!');
    exit;
  end;
{$ENDIF}
  Result := dmNFVenda.NFVENDA_Faturar;
end;

function TdmNFVenda.temProdutoSemEstoque(pCodNF: Integer; pCodSerie: string; pTipo: string; AReabrirRegistro: Boolean = True): Boolean;
begin
  if ((pTipo = '1') or (pTipo = 'E')) then
  begin
    Result := False;
    Exit;
  end;

  if AReabrirRegistro then
  begin
    dmNFVenda.cdsNFVendaItem.Close;
    dmNFVenda.cdsNFVendaItem.Params[0].AsInteger := pCodNF;
    dmNFVenda.cdsNFVendaItem.Params[1].AsString := pCodSerie;
    dmNFVenda.cdsNFVendaItem.Open;
  end;

  result := False;
  //
  dmNFVenda.cdsNFVendaItem.First;
  while not dmNFVenda.cdsNFVendaItem.Eof do
  begin
    if dmNFVenda.cdsNFVendaItemPRO_ESTQ_ATUAL.AsCurrency < dmNFVenda.cdsNFVendaItemNFVI_QTDE.AsCurrency then
    begin
      //
      if (cdsNFVendaItemPRO_ESTQ_RESERVADO.AsCurrency > 0) and (cdsNFVendaItemCODPEDVENDAITEM.AsInteger > 0) then
      begin
        dmAcesso.sqlVariant_2.Close;
        dmAcesso.sqlVariant_2.CommandText :=
          ' SELECT ' +
          '   PRODUTO_RESERVA.PROR_QTDE ' +
          ' FROM ' +
          '   PRODUTO_RESERVA ' +
          ' where ' +
          '   PRODUTO_RESERVA.CODPRODUTO = ' + cdsNFVendaItemCODPRODUTO.AsString +
          '   AND PRODUTO_RESERVA.CODPEDVENDAITEM = ' + cdsNFVendaItemCODPEDVENDAITEM.AsString;
        dmAcesso.sqlVariant_2.Open;
        //
        if not (dmAcesso.sqlVariant_2.IsEmpty) then
        begin
          if (
            (dmNFVenda.cdsNFVendaItemPRO_ESTQ_ATUAL.AsCurrency + dmAcesso.sqlVariant_2.FieldByName('PROR_QTDE').AsCurrency) <
            dmNFVenda.cdsNFVendaItemNFVI_QTDE.AsCurrency
            )
            then
          begin
            Result := True;
            Exit;
          end;
        end
        else
        begin
          Result := True;
          Exit;
        end;
      end
      else
      begin
        Result := True;
        Exit;
      end;
    end;
    //
    dmNFVenda.cdsNFVendaItem.Next;
  end;
end;

procedure TdmNFVenda.ValidaCfop;
begin
  if (Trim(cdsNFVendaCODCFOP.AsString) <> '') and
    (Trim(cdsNFVendaPES_UF.AsString) <> '')
    then
  begin
    if (copy(Trim(cdsNFVendaCODCFOP.AsString), 1, 1) = '6') and
      (Trim(cdsNFVendaPES_UF.AsString) = dmAcesso.cdsParGeralPARG_UF.AsString)
      then
      raise Exception.Create('Esse Cfop (' + cdsNFVendaCODCFOP.AsString + ') só aceita pessoas de fora do estado')
    else if (copy(Trim(cdsNFVendaCODCFOP.AsString), 1, 1) = '5') and
      (Trim(cdsNFVendaPES_UF.AsString) <> dmAcesso.cdsParGeralPARG_UF.AsString)
      then
      raise Exception.Create('Esse Cfop (' + cdsNFVendaCODCFOP.AsString + ') só aceita pessoas de dentro do estado');
  end;
end;

end.




begin
  dmGlobal.cdsCadNot.Locate('CodEmp; NumeNF', VarArrayOf([Empresa, StrZero(StrToInt(edtNumeNF.Text), 6)]), []);

  edtChave.Text := Trim(dmGlobal.cdsCadNotNFeChave.AsString);
  edtChave.Text := Trim(OnlyNumber(edtChave.Text));

  edtCNPJ.Text := Copy(edtChave.Text, 7, 14);



end;
