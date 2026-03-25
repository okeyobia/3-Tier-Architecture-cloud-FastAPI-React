import axios from "axios";

const API_URL = process.env.REACT_APP_API_URL || "http://localhost:80/api";

export const getHealth = async () => {
  const response = await axios.get(`${API_URL}/health`);
  return response.data;
};

export const getUsers = async () => {
  const response = await axios.get(`${API_URL}/users`);
  return response.data;
};
