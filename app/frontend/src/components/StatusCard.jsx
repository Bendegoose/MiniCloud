
import './ComponentStyles/StatusCard.css';

export default function StatusCard({ response }) {
  return (

    <div className="status-container">
      <div className="status-card">
        <h3 className="status-card__title">Response:</h3>
        <p className="status-card__value">{response}</p>
      </div>
    </div>
  );
}