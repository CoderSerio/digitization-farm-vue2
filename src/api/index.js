import request from "@/utils/request";

export const getEchartsData = async () => {
  const res = await request.get('/getEchartsData');
  return res;
};

export const getMessageData = async () => {
  const res = await request.get('/getMessageData');
  return res;
};

export const getOverviewData = async () => {
  const res = await request.get('/getOverviewData');
  return res;
};

export const getStatisticsData = async () => {
  const res = await request.get('/getStatisticsData');
  return res;
};

export const getTableListData = async () => {
  const res = await request.get('/getTableListData');
  return res;
};