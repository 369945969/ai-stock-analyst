/*
 Navicat Premium Dump SQL

 Source Server         : future
 Source Server Type    : MariaDB
 Source Server Version : 101115 (10.11.15-MariaDB)
 Source Host           : 76.13.11.164:3306
 Source Schema         : stocks

 Target Server Type    : MariaDB
 Target Server Version : 101115 (10.11.15-MariaDB)
 File Encoding         : 65001

 Date: 06/03/2026 20:00:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asset_balance_sheet
-- ----------------------------
DROP TABLE IF EXISTS `asset_balance_sheet`;
CREATE TABLE `asset_balance_sheet` (
  `股票代码` text DEFAULT NULL,
  `货币资金` double DEFAULT NULL,
  `交易性金融资产` double DEFAULT NULL,
  `应收票据及应收账款` double DEFAULT NULL,
  `预付款项` double DEFAULT NULL,
  `其他应收款合计` double DEFAULT NULL,
  `应收股利` double DEFAULT NULL,
  `应收利息` double DEFAULT NULL,
  `存货` double DEFAULT NULL,
  `合同资产` double DEFAULT NULL,
  `划分为持有待售的资产` double DEFAULT NULL,
  `一年内到期的非流动资产` double DEFAULT NULL,
  `结算备付金` double DEFAULT NULL,
  `拆出资金` double DEFAULT NULL,
  `买入返售金融资产` double DEFAULT NULL,
  `其他流动资产` double DEFAULT NULL,
  `流动资产` double DEFAULT NULL,
  `可供出售金融资产` double DEFAULT NULL,
  `持有至到期投资` double DEFAULT NULL,
  `投资性房地产` double DEFAULT NULL,
  `长期股权投资` double DEFAULT NULL,
  `长期应收款` double DEFAULT NULL,
  `固定资产` double DEFAULT NULL,
  `固定资产清理` double DEFAULT NULL,
  `在建工程` double DEFAULT NULL,
  `工程物资` double DEFAULT NULL,
  `生产性生物资产` double DEFAULT NULL,
  `油气资产` double DEFAULT NULL,
  `无形资产` double DEFAULT NULL,
  `开发支出` double DEFAULT NULL,
  `商誉` double DEFAULT NULL,
  `长期待摊费用` double DEFAULT NULL,
  `递延所得税资产` double DEFAULT NULL,
  `发放贷款及垫款` double DEFAULT NULL,
  `其他非流动资产` double DEFAULT NULL,
  `债权投资` double DEFAULT NULL,
  `其他债权投资` double DEFAULT NULL,
  `其他权益工具投资` double DEFAULT NULL,
  `衍生金融资产` double DEFAULT NULL,
  `其他非流动金融资产` double DEFAULT NULL,
  `非流动资产` double DEFAULT NULL,
  `总资产` double DEFAULT NULL,
  `短期借款` double DEFAULT NULL,
  `向中央银行借款` double DEFAULT NULL,
  `吸收存款及同业存放` double DEFAULT NULL,
  `拆入资金` double DEFAULT NULL,
  `交易性金融负债` double DEFAULT NULL,
  `衍生金融负债` double DEFAULT NULL,
  `应付票据及应付账款` double DEFAULT NULL,
  `应付票据` double DEFAULT NULL,
  `应付账款` double DEFAULT NULL,
  `预收款项` double DEFAULT NULL,
  `合同负债` double DEFAULT NULL,
  `卖出回购金融资产款` double DEFAULT NULL,
  `应付手续费及佣金` double DEFAULT NULL,
  `应付职工薪酬` double DEFAULT NULL,
  `应交税费` double DEFAULT NULL,
  `其他应付款合计` double DEFAULT NULL,
  `应付利息` double DEFAULT NULL,
  `应付股利` double DEFAULT NULL,
  `其他应付款` double DEFAULT NULL,
  `划分为持有待售的负债` double DEFAULT NULL,
  `一年内到期的非流动负债` double DEFAULT NULL,
  `其他流动负债` double DEFAULT NULL,
  `流动负债` double DEFAULT NULL,
  `长期借款` double DEFAULT NULL,
  `应付债券` double DEFAULT NULL,
  `长期应付职工薪酬` double DEFAULT NULL,
  `长期应付款` double DEFAULT NULL,
  `专项应付款` double DEFAULT NULL,
  `预计负债` double DEFAULT NULL,
  `递延收益_流动` double DEFAULT NULL,
  `递延收益_非流动` double DEFAULT NULL,
  `递延所得税负债` double DEFAULT NULL,
  `其他非流动负债` double DEFAULT NULL,
  `非流动负债` double DEFAULT NULL,
  `总负债` double DEFAULT NULL,
  `股本` double DEFAULT NULL,
  `其他权益工具` double DEFAULT NULL,
  `资本公积` double DEFAULT NULL,
  `盈余公积` double DEFAULT NULL,
  `未分配利润` double DEFAULT NULL,
  `其他综合收益` double DEFAULT NULL,
  `专项储备` double DEFAULT NULL,
  `一般风险准备` double DEFAULT NULL,
  `归属母公司股东权益` double DEFAULT NULL,
  `少数股东权益` double DEFAULT NULL,
  `所有者权益合计` double DEFAULT NULL,
  `最新公告日期` date DEFAULT NULL,
  `报告期` date DEFAULT NULL,
  `固定资产合计` double DEFAULT NULL,
  `在建工程合计` double DEFAULT NULL,
  `长期应付款合计` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Table structure for cash_flow
-- ----------------------------
DROP TABLE IF EXISTS `cash_flow`;
CREATE TABLE `cash_flow` (
  `股票代码` text DEFAULT NULL,
  `销售商品提供劳务收到的现金` double DEFAULT NULL,
  `收到的税费返还` double DEFAULT NULL,
  `收到其他与经营活动有关的现金` double DEFAULT NULL,
  `经营活动现金流入` double DEFAULT NULL,
  `购买商品接受劳务支付的现金` double DEFAULT NULL,
  `支付给职工以及为职工支付的现金` double DEFAULT NULL,
  `支付的各项税费` double DEFAULT NULL,
  `支付其他与经营活动有关的现金` double DEFAULT NULL,
  `经营活动现金流出` double DEFAULT NULL,
  `经营性现金流净额` double DEFAULT NULL,
  `投资现金流净额` double DEFAULT NULL,
  `筹资活动现金流净额` double DEFAULT NULL,
  `汇率变动对现金的影响` double DEFAULT NULL,
  `现金及现金等价物净增加额` double DEFAULT NULL,
  `期初现金及现金等价物余额` double DEFAULT NULL,
  `期末现金及现金等价物余额` double DEFAULT NULL,
  `资产减值准备` double DEFAULT NULL,
  `固定资产折旧油气资产折耗生产性生物资产折旧` double DEFAULT NULL,
  `无形资产摊销` double DEFAULT NULL,
  `长期待摊费用摊销` double DEFAULT NULL,
  `处置固定无形其他长期资产的损失` double DEFAULT NULL,
  `固定资产报废损失` double DEFAULT NULL,
  `公允价值变动损失` double DEFAULT NULL,
  `财务费用` double DEFAULT NULL,
  `投资损失` double DEFAULT NULL,
  `递延所得税资产减少` double DEFAULT NULL,
  `递延所得税负债增加` double DEFAULT NULL,
  `存货的减少` double DEFAULT NULL,
  `经营性应收项目的减少` double DEFAULT NULL,
  `经营性应付项目的增加` double DEFAULT NULL,
  `最新公告日期` date DEFAULT NULL,
  `报告期` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Table structure for daily_kline
-- ----------------------------
DROP TABLE IF EXISTS `daily_kline`;
CREATE TABLE `daily_kline` (
  `股票代码` text DEFAULT NULL,
  `股票名称` text DEFAULT NULL,
  `交易日期` datetime DEFAULT NULL,
  `开盘价` double DEFAULT NULL,
  `最高价` double DEFAULT NULL,
  `最低价` double DEFAULT NULL,
  `收盘价` double DEFAULT NULL,
  `成交量` double DEFAULT NULL,
  `成交额` double DEFAULT NULL,
  `总市值` double DEFAULT NULL,
  KEY `daily_kline_stock_code` (`股票代码`(768)),
  KEY `daily_kline_stock_name` (`股票名称`(768)),
  KEY `daily_kline_date` (`交易日期`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for stock_profit_sheet
-- ----------------------------
DROP TABLE IF EXISTS `stock_profit_sheet`;
CREATE TABLE `stock_profit_sheet` (
  `股票代码` text DEFAULT NULL,
  `营业总收入` double DEFAULT NULL,
  `营业收入` double DEFAULT NULL,
  `营业总成本` double DEFAULT NULL,
  `营业成本` double DEFAULT NULL,
  `利息收入` double DEFAULT NULL,
  `利息支出` double DEFAULT NULL,
  `税金及附加` double DEFAULT NULL,
  `销售费用` double DEFAULT NULL,
  `管理费用` double DEFAULT NULL,
  `研发费用` double DEFAULT NULL,
  `财务费用` double DEFAULT NULL,
  `财务费用_利息支出` double DEFAULT NULL,
  `财务费用_利息收入` double DEFAULT NULL,
  `资产减值损失` double DEFAULT NULL,
  `信用减值损失` double DEFAULT NULL,
  `公允价值变动收益` double DEFAULT NULL,
  `投资收益` double DEFAULT NULL,
  `联营企业和合营企业投资收益` double DEFAULT NULL,
  `汇兑收益` double DEFAULT NULL,
  `其他收益` double DEFAULT NULL,
  `资产处置收益` double DEFAULT NULL,
  `营业利润` double DEFAULT NULL,
  `营业外收入` double DEFAULT NULL,
  `营业外支出` double DEFAULT NULL,
  `利润总额` double DEFAULT NULL,
  `所得税费用` double DEFAULT NULL,
  `净利润` double DEFAULT NULL,
  `归属母公司净利润` double DEFAULT NULL,
  `少数股东损益` double DEFAULT NULL,
  `基本每股收益` double DEFAULT NULL,
  `稀释每股收益` double DEFAULT NULL,
  `其他综合收益` double DEFAULT NULL,
  `最新公告日期` date DEFAULT NULL,
  `报告期` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
-- Table structure for sw_index
-- ----------------------------
DROP TABLE IF EXISTS `sw_index`;
CREATE TABLE `sw_index` (
  `一级行业代码` text DEFAULT NULL,
  `一级行业名称` text DEFAULT NULL,
  `二级行业代码` text DEFAULT NULL,
  `二级行业名称` text DEFAULT NULL,
  `三级行业代码` text DEFAULT NULL,
  `三级行业名称` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for sw_index_stocks
-- ----------------------------
DROP TABLE IF EXISTS `sw_index_stocks`;
CREATE TABLE `sw_index_stocks` (
  `股票代码` text DEFAULT NULL,
  `股票简称` text DEFAULT NULL,
  `纳入时间` text DEFAULT NULL,
  `一级行业代码` text DEFAULT NULL,
  `一级行业名称` text DEFAULT NULL,
  `二级行业代码` text DEFAULT NULL,
  `二级行业名称` text DEFAULT NULL,
  `三级行业代码` text DEFAULT NULL,
  `三级行业名称` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
