import { useState, useEffect } from 'react'
import './App.css'
import StatusCard from './components/StatusCard.jsx'

function App() {
  const [data, setData] = useState({
    health: null,
    status: null
  });

  useEffect(() => {
    async function fetchData() {
      const [health, status] = await Promise.all([
        fetch('/health'),
        fetch('/api/status')
      ]);

      const healthData = await health.json();
      const statusData = await status.json();

      setData({
        health: healthData.health,
        status: statusData.status
      });
    }
    fetchData();

  }, []);

  return (
    <>
      {Object.entries(data).map(([name, value]) => (
        <StatusCard key={name} response={`${name}: ${value ?? 'Loading...'}`} />
      ))}
    </>
  )
}

export default App
