// SpotifyPlayer.js
import { LightningElement, api, track } from 'lwc';
import generateResponseFromGPT from '@salesforce/apex/SpotifyIntegration.generateResponseFromGPT';

export default class SpotifyPlayer extends LightningElement {
    @api playlistId;
    @track spotifyTrackPreviewUrl;
    @track isAudioPlaying = false;

    connectedCallback() {
        // Fetch Spotify track data when the component is connected to the DOM
        this.fetchSpotifyTrack();
    }

    async fetchSpotifyTrack() {
        try {
            // Make the call to the Apex method to get the Spotify track name
            const response = await generateResponseFromGPT({ queryText: '61Q6YpyhCqMwQDH9hpZfxO' });
            // Parse the JSON response
            const spotifyData = JSON.parse(response);

            // Assuming you want to play the first track in the playlist
            const firstTrack = spotifyData.tracks.items[0].track;

            // Set the track preview URL to the component property
            this.spotifyTrackPreviewUrl = firstTrack.preview_url;
        } catch (error) {
            console.error('Error fetching Spotify track:', error);
        }
    }

    async handlePlayClick() {
        try {
            // Make the call to the Apex method to play the Spotify track
            await generateResponseFromGPT({ queryText: '61Q6YpyhCqMwQDH9hpZfxO' });

            // Toggle the play state
            this.isAudioPlaying = !this.isAudioPlaying;
        } catch (error) {
            console.error('Error playing Spotify track:', error);
        }
    }
}
