import { useState } from 'react'
import './App.css'
import StatusCard from './components/StatusCard.jsx'

function App() {

  return (
    <>
      <StatusCard name="Service 1" status="online" description="This is a sample service." />
    </>
  )
}

export default App
