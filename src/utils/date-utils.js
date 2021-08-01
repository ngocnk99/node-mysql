import moment from 'moment';

/**
  * DateNowString.
  *
  * @returns {String}
  */
export const dateNowString = () => {
  const now = moment();
  const month = now.month() + 1 < 10 ? `0${now.month() + 1}` : `${now.month() + 1}`;
  const date = now.date() < 10 ? `0${now.date()}` : `${now.date()}`;
  const year = now.year();

  return `${year}${month}${date}`;
}

/**
  * DatetimeNowString.
  *
  * @returns {String}
  */
export const datetimeNowString = () => {
  const now = moment();
  const month = now.month() + 1 < 10 ? `0${now.month() + 1}` : `${now.month() + 1}`;
  const date = now.date() < 10 ? `0${now.date()}` : `${now.date()}`;
  const year = now.year();
  const hour = now.hour();
  const minute = now.minute();
  const second = now.second();
  const miliSecond = now.millisecond();
  
  return `${year}_${month}_${date}_${hour}_${minute}_${second}_${miliSecond}`;
}

/**
  * DateNowString.
  *
  * @returns {String}
  */
export const monthNowString = () => {
  const now = moment();
  const month = now.month() + 1 < 10 ? `0${now.month() + 1}` : `${now.month() + 1}`;
  // const date = now.date() < 10 ? `0${now.date()}` : `${now.date()}`;
  const year = now.year();

  return `${year}${month}`;
}