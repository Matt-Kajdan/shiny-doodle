<script lang="ts">
    import Modal from './Modal.svelte';

    export let title = '';
    export let description = ''; // Default description
    export let images = ['']; // Explicitly define images as an array of strings
    export let descriptionMap: Record<number, string> = {}; // Use Record to allow indexing by number

    let showModal = false;
    let selectedImage = images[0]; // Initially set to the first image
    let currentIndex = 0; // Index to track the currently displayed image

    // Function to open the modal and set the selected image
    const openModal = (image: string, index: number) => {
        selectedImage = image;
        currentIndex = index; // Set the current index
        showModal = true;
    };

    // Function to handle key presses
    const handleKeyDown = (event: KeyboardEvent) => {
        if (event.key === 'ArrowRight') {
            nextImage(); // Navigate to next image
        } else if (event.key === 'ArrowLeft') {
            previousImage(); // Navigate to previous image
        }
    };

    // Navigate to the next image
    const nextImage = () => {
        if (currentIndex < images.length - 1) {
            currentIndex += 1;
        }
    };

    // Navigate to the previous image
    const previousImage = () => {
        if (currentIndex > 0) {
            currentIndex -= 1;
        }
    };

    // Reactive statement to update the selected image and description
    $: {
        selectedImage = images[currentIndex];
        // Check if there is a custom description for the current index; if not, use the default description
        description = descriptionMap[currentIndex] !== undefined ? descriptionMap[currentIndex] : description; 
    }

    // Listen for keydown events when the modal is open
    $: if (showModal) {
        window.addEventListener('keydown', handleKeyDown);
    }

    // Clean up the event listener when modal is closed
    const closeModal = () => {
        showModal = false;
        window.removeEventListener('keydown', handleKeyDown);
    };
</script>

<style>
    /* Your existing styles */
    main {
        display: flex;
        flex-direction: column;
        gap: 2rem;
    }

    .display {
        display: flex;
        gap: 3rem;
        align-items: flex-start;
        height: calc(100vh - 19.5rem);
    }

    .column {
        display: flex;
        flex-direction: column;
        flex: 1;
        justify-content: space-between;
        height: 100%;
    }

    .column p {
        margin: 0;
    }

    /* .text {
        min-height: 20%;
    } */

    .navigation {
        margin-top: 2rem;
        display: flex;
        flex-direction: row;
        /* justify-content: center; */
    }

    .arrow {
        height: 2rem;
        fill: currentColor;
        padding: 1rem 2rem;
    }

    .image-container {  
        width: 70%;
        height: 100%;
        display: flex;
        align-items: flex-start;
        justify-content: center;
        object-fit: contain;
    }

    .image {
        max-width: 100%;
        max-height: 100%;
        border-radius: 1rem;
        object-fit: contain;
        user-select: none;
        box-shadow: var(--def-shadow);
    }

    .image:hover {
        box-shadow: var(--hov-shadow);
    }

    .image-btn {
        padding: 0;
        margin: 0;
        border: none;
        background: transparent;
        cursor: pointer;
        line-height: 0;
        border-radius: 1rem;
    }

    #modal-content {
        max-width: 80vw;
        max-height: 80vh;
    }

    @media (hover: none) and (pointer: coarse) and (orientation: portrait) {
        .display {
        display: flex;
        gap: 3rem;
        align-items: flex-start;
        flex-direction: column;
        height: calc(100vh - 19.5rem);
        }
}

    /* When viewport is square or portrait (<= 1:1), stack content vertically */
    @media (max-aspect-ratio: 1/1) {
        .display {
            flex-direction: column;
        }
        .image-container {
            width: 100%;
        }
    }

</style>

<main>
    <div class="display">
        <div class="column">
            <div class="text">
                <h2>{title}</h2>
                <p>{description}</p>
            </div>
            {#if images.length > 1} <!-- Check if there are more than one image -->
                <div class="navigation">
                    <button on:click={previousImage} class="arrow-btn" aria-label="Previous image">
                        <svg id="arl" class="arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.4 220.8">
                            <path d="M110.4,220.8c-5.12,0-10.24-1.95-14.14-5.86L5.86,124.54c-7.81-7.81-7.81-20.47,0-28.28L96.26,5.86c7.81-7.81,20.48-7.81,28.28,0,7.81,7.81,7.81,20.47,0,28.28L48.28,110.4l76.26,76.26c7.81,7.81,7.81,20.47,0,28.29-3.91,3.91-9.02,5.86-14.14,5.86Z"/>
                        </svg>
                    </button>
                    <button on:click={nextImage} class="arrow-btn" aria-label="Next image">
                        <svg id="arr" class="arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 130.4 220.8">
                            <path d="M20,220.8c-5.12,0-10.24-1.95-14.14-5.86-7.81-7.81-7.81-20.47,0-28.29l76.26-76.26L5.86,34.14C-1.95,26.33-1.95,13.67,5.86,5.86c7.81-7.81,20.47-7.81,28.28,0l90.4,90.4c7.81,7.81,7.81,20.47,0,28.28l-90.4,90.4c-3.91,3.91-9.02,5.86-14.14,5.86Z"/>
                        </svg>
                    </button>
                </div>  
            {/if}          
        </div>
        <div class="image-container">
            {#if images[currentIndex]}
                <button type="button" class="image-btn" aria-label={`Open image ${currentIndex + 1} of ${images.length}`} on:click={() => openModal(images[currentIndex], currentIndex)}>
                    <img class="image" src={images[currentIndex]} alt={title} />
                </button>
            {/if}
        </div>
    </div>

    <!-- Modal component that displays the selected image -->
    <Modal bind:showModal on:close={closeModal}>
        <img id="modal-content" src={selectedImage} alt={title}/>
    </Modal>
</main>
