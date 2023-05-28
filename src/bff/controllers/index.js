const express = require('express');
const router = express.Router();

const echartsDao = require('../models/echartsDao');
const messageDao = require('../models/messageDao');
const overviewDao = require('../models/overviewDao');
const statisticsDao = require('../models/statisticsDao');
const tableListDao = require('../models/tableListDao');


router.all('*', express.json());

router.get('/getEchartsData', (req, res) => {
  echartsDao.getEchartsData((data) => {
    console.log(data);
    res.send(data);
  });
});

router.get('/getMessageData', (req, res) => {
  messageDao.getMessageData((data) => {
    console.log(data);
    const value = data?.[0]?.data
    res.send(value);
  });
});

router.get('/getOverviewData', (req, res) => {
  overviewDao.getOverviewData((data) => {
    console.log(data);
    res.send(data);
  });
});


router.get('/getStatisticsData', (req, res) => {
  statisticsDao.getStatisticsData((data) => {
    console.log(data);
    res.send(data);
  });
});

router.get('/getTableListData', (req, res) => {
  tableListDao.getTableListData((data) => {
    console.log(data);
    res.send(data);
  });
});


module.exports = router;